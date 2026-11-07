`timescale 1ns / 1ps
module tb_multiplier_fabric;
reg signed [7:0] data_a, data_b;
wire signed [15:0] prod_out;
reg signed [15:0] expected;
integer i, j, errors;
// Device under test
multiplier_fabric dut (
.data_a (data_a),
.data_b (data_b),
.prod_out(prod_out)
);

// Apply one stimulus pair, wait for the logic to settle, then check
task check(input signed [7:0] a, input signed [7:0] b);
begin
data_a = a; data_b = b;
expected = a * b;
#10;
$display("%4d x %4d = %6d (expected %6d)", a, b, prod_out, expected);
if (prod_out !== expected) begin
errors = errors + 1;
$display("ERROR: %0d x %0d = %0d (expected %0d)",
a, b, prod_out, expected);
end
end
endtask
initial begin
errors = 0;
$display("TB1: simulation started");
// 1. Directed corner cases
check( 0, 0); check( 1, 1); check( 5, 7);
check( -3, 4); check( 6, -9); check(-12, -11);
check(127, 127); check(-128, -128); check(-128, 127);
check(127, -128); check( -1, -1);
// 2. Random test: 64 random operand pairs (all fit inside the default 1 us
run)
for (i = 0; i < 64; i = i + 1)
check($random, $random);
// 3. Report
if (errors == 0) $display("PASS: all tests completed with 0 errors.");
else $display("FAIL: %0d errors detected.", errors);
$finish;
end
endmodule