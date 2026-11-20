// y[n] = H0*x[n] + H1*x[n-1] + H2*x[n-2] + H3*x[n-3] (latency: 6 clocks)
(* use_dsp = "yes" *)
module dsp_fir_filter (
input wire clk,
input wire reset,
input wire signed [15:0] x_in,
output reg signed [15:0] y_out
);
// Q0.15 coefficients: 0.125, 0.375, 0.375, 0.125 (sum = 1.0)
localparam signed [15:0] H0 = 16'sd4096;
localparam signed [15:0] H1 = 16'sd12288;
localparam signed [15:0] H2 = 16'sd12288;
localparam signed [15:0] H3 = 16'sd4096;
// Input delay line: TWO registers between neighbouring taps, because each
// partial sum travels through one product register per tap.
reg signed [15:0] xa0, xb1, xa1, xb2, xa2, xb3, xa3;
// Partial-sum (PCOUT -> PCIN) chain
reg signed [47:0] p0, p1, p2, p3;
always @(posedge clk) begin
if (reset) begin
xa0 <= 0; xb1 <= 0; xa1 <= 0; xb2 <= 0;
xa2 <= 0; xb3 <= 0; xa3 <= 0;
p0 <= 0; p1 <= 0; p2 <= 0; p3 <= 0;
y_out <= 0;
end else begin
// delay line
xa0 <= x_in;
xb1 <= xa0; xa1 <= xb1;
xb2 <= xa1; xa2 <= xb2;
xb3 <= xa2; xa3 <= xb3;
// multiply-accumulate cascade
p0 <= xa0 * H0;
p1 <= xa1 * H1 + p0;
p2 <= xa2 * H2 + p1;
p3 <= xa3 * H3 + p2;
// drop the 15 fractional bits of Q0.15
y_out <= p3[30:15];
end
end
endmodule