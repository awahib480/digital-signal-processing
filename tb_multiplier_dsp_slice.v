`timescale 1ns / 1ps
module tb_multiplier_dsp_slice;
localparam LATENCY = 3; // input regs -> product reg -> output reg
reg clk, reset;
reg signed [15:0] data_a, data_b;
wire signed [31:0] prod_out;
reg signed [31:0] exp_pipe [0:LATENCY-1]; // expected-value delay line
reg signed [31:0] expected;
integer n, k, errors, checked;
// Device under test
multiplier_dsp_slice dut (
.clk (clk),
.reset (reset),
.data_a (data_a),
.data_b (data_b),
.prod_out(prod_out)
);
// 100 MHz clock
initial clk = 1'b0;
always #5 clk = ~clk;
// Scoreboard: model the 3-cycle latency and compare on every clock edge
always @(posedge clk) begin
if (reset) begin
for (k = 0; k < LATENCY; k = k + 1) exp_pipe[k] <= 32'sd0;
end else begin
exp_pipe[0] <= data_a * data_b;
for (k = 1; k < LATENCY; k = k + 1) exp_pipe[k] <= exp_pipe[k-1];
end
end
always @(negedge clk) begin
if (!reset && n >= LATENCY + 2) begin // skip pipeline fill
expected = exp_pipe[LATENCY-1];
checked = checked + 1;
if (prod_out !== expected) begin
errors = errors + 1;
$display("ERROR @%0t: prod_out = %0d, expected %0d",
$time, prod_out, expected);
end
end
end
initial begin
errors = 0; checked = 0; n = 0;
$display("TB2: simulation started");
reset = 1'b1; data_a = 0; data_b = 0;
repeat (3) @(negedge clk);
reset = 1'b0;
// Directed stimulus: one new operand pair every clock cycle
@(negedge clk); data_a = 16'sd3; data_b = 16'sd4;
@(negedge clk); data_a = -16'sd7; data_b = 16'sd5;
@(negedge clk); data_a = 16'sd100; data_b = -16'sd100;
@(negedge clk); data_a = -16'sd32768; data_b = -16'sd32768;
@(negedge clk); data_a = 16'sd32767; data_b = 16'sd32767;
@(negedge clk); data_a = -16'sd32768; data_b = 16'sd32767;
// 40 random pairs
repeat (40) begin
@(negedge clk);
data_a = $random;
data_b = $random;
end
// Mid-run reset: output must return to zero
@(negedge clk); reset = 1'b1;
repeat (2) @(negedge clk);
if (prod_out !== 32'sd0) begin
errors = errors + 1;
$display("ERROR: prod_out not cleared by reset");
end
reset = 1'b0;
repeat (LATENCY + 2) @(negedge clk);
if (errors == 0) $display("PASS: %0d results checked, 0 errors.", checked);
else $display("FAIL: %0d errors in %0d checks.",
errors, checked);
$finish;
end
always @(negedge clk) n = n + 1;
endmodule