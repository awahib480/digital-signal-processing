module multiplier_fabric (
input signed [7:0] data_a,
input signed [7:0] data_b,
output signed [15:0] prod_out
);
// Without a clock or registers, this expression is forced entirely
// into standard fabric LUTs.
assign prod_out = data_a * data_b;
endmodule
