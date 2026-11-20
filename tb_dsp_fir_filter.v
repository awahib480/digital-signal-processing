`timescale 1ns / 1ps
module tb_dsp_fir_filter;
// One clock = one audio sample (fs = 48 kHz). The 2 ns clock period only
// makes the whole test fit inside Vivado's default 1 us run time.
localparam real FS = 48000.0;
localparam real PI = 3.14159265358979;
localparam real AMP = 10000.0;
localparam integer LATENCY = 6; // pipeline latency of the filter (clocks)
localparam integer SETTLE = 6; // extra samples to let the filter settle
localparam integer MEASURE = 48; // whole number of cycles for every tone
reg clk, reset;
reg signed [15:0] x_in;
wire signed [15:0] y_out;
integer errors, t, n, k;
real f, sx, sy, gain_db, exp_db;
real freqs [0:4];
// Device under test
dsp_fir_filter dut (.clk(clk), .reset(reset), .x_in(x_in), .y_out(y_out));
initial clk = 1'b0;
always #1 clk = ~clk; // 2 ns period
initial begin
errors = 0;
freqs[0] = 1000.0; freqs[1] = 3000.0; freqs[2] = 6000.0;
freqs[3] = 12000.0; freqs[4] = 18000.0;
$display("TB: simulation started");
reset = 1'b1; x_in = 0;
repeat (3) @(negedge clk);
reset = 1'b0;
// ---- Test 1: impulse response = coefficients 0.125 0.375 0.375 0.125
@(negedge clk); x_in = 16'sd16000; // impulse
@(negedge clk); x_in = 16'sd0;
repeat (4) @(negedge clk); // wait for the pipeline
$display("Impulse response (input 16000):");
for (k = 0; k < 4; k = k + 1) begin
@(negedge clk);
$display(" tap %0d: y = %0d", k, y_out); // 2000 6000 6000 2000
end
// ---- Test 2: gain at five tone frequencies ----
$display("Gain at five frequencies (theory = 60*log10(cos(pi*f/fs))):");
for (t = 0; t < 5; t = t + 1) begin
f = freqs[t]; sx = 0.0; sy = 0.0;
for (n = 0; n < LATENCY + SETTLE + MEASURE; n = n + 1) begin
@(negedge clk);
x_in = $rtoi(AMP * $sin(2.0 * PI * f / FS * n));
if (n >= LATENCY + SETTLE) begin // skip latency, settling
sx = sx + $itor(x_in) * $itor(x_in);
sy = sy + $itor(y_out) * $itor(y_out);
end
end
gain_db = 10.0 * $log10(sy / sx);
exp_db = 60.0 * $log10($cos(PI * f / FS));
$display(" %5.0f Hz: measured %7.2f dB theory %7.2f dB",
f, gain_db, exp_db);
if (gain_db > exp_db + 0.25 || gain_db < exp_db - 0.25)
errors = errors + 1;
end
if (errors == 0) $display("PASS: filter response matches theory.");
else $display("FAIL: %0d tones off by more than 0.25 dB.", errors);
$finish;
end
endmodule