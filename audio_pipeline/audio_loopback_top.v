// real-time PDM-to-PWM audio pipeline

module audio_loopback_top (
input wire clk, // 100 MHz system clock
input wire cpu_resetn, // CPU_RESET button (active LOW on the Nexys A7)
output reg m_clk, // PDM microphone clock
input wire m_data, // PDM microphone data
output wire m_lrsel, // microphone channel select (tied low)
output wire aud_pwm, // PWM audio output
output wire aud_sd // audio amplifier enable
);
wire reset = ~cpu_resetn; // internal active-high reset
assign aud_sd = 1'b1;
assign m_lrsel = 1'b0;
//--------------------------------------------------------------------
// 1. Generate the 2.4 MHz microphone clock (100 MHz / 42)
//--------------------------------------------------------------------
reg [5:0] clk_div_reg = 6'd0;
initial m_clk = 1'b0;
always @(posedge clk) begin
if (reset) begin
clk_div_reg <= 6'd0;
m_clk <= 1'b0;
end else if (clk_div_reg == 6'd20) begin // 21 cycles per half period
clk_div_reg <= 6'd0;
m_clk <= ~m_clk;
end else
clk_div_reg <= clk_div_reg + 6'd1;
end
// Rising edge of m_clk, seen from the 100 MHz domain
reg m_clk_delayed = 1'b0;
always @(posedge clk) m_clk_delayed <= m_clk;
wire m_clk_edge = m_clk && !m_clk_delayed;
//--------------------------------------------------------------------
// 2. Decimation filter: PDM (1 bit, 2.4 MHz) -> PCM (16 bit, ~48 kHz)
//--------------------------------------------------------------------
reg [5:0] decim_counter = 6'd0;
reg [15:0] pdm_accumulator = 16'd0;
reg signed [15:0] pcm_sample_reg = 16'sd0;
always @(posedge clk) begin
if (reset) begin
decim_counter <= 6'd0;
pdm_accumulator <= 16'd0;
pcm_sample_reg <= 16'sd0;
end else if (m_clk_edge) begin
if (decim_counter == 6'd49) begin // 50th bit: output
decim_counter <= 6'd0;
pcm_sample_reg <=
$signed((pdm_accumulator * 16'd1310) - 16'd32768);
pdm_accumulator <= {15'd0, m_data}; // start next block
end else begin
decim_counter <= decim_counter + 6'd1;
pdm_accumulator <= pdm_accumulator + {15'd0, m_data};
end
end
end
//--------------------------------------------------------------------
// 3. PWM engine: 10-bit counter, 100 MHz / 1024 = 97.66 kHz carrier
//--------------------------------------------------------------------
wire [15:0] pcm_unsigned = pcm_sample_reg + 16'h8000; // signed -> unsigned
wire [9:0] pwm_duty = pcm_unsigned[15:6]; // top 10 bits
reg [9:0] pwm_counter = 10'd0;
always @(posedge clk) pwm_counter <= pwm_counter + 10'd1;
assign aud_pwm = (pwm_counter < pwm_duty);
endmodule
