(* use_dsp = "yes" *)
(* use_dsp48 = "yes" *)
module multiplier_dsp_slice (
input clk,
input reset,
input signed [15:0] data_a,
input signed [15:0] data_b,
output reg signed [31:0] prod_out
);
// 1. Input Registers: Caches input data signals safely into the DSP slice
// front-end
reg signed [15:0] a_reg;
reg signed [15:0] b_reg;
// 2. Intermediate Product Register: Captures raw core math output
reg signed [31:0] multi_core_reg;
always @(posedge clk) begin
if (reset) begin
a_reg <= 16'd0;
b_reg <= 16'd0;
multi_core_reg <= 32'd0;
prod_out <= 32'd0;
end else begin
// Cycle 1: Capture inputs inside the DSP block boundary registers
a_reg <= data_a;
b_reg <= data_b;
// Cycle 2: Structural multiplication maps directly to hard
// math array core
multi_core_reg <= a_reg * b_reg;
// Cycle 3: Clean registered output mapping
prod_out <= multi_core_reg;
end
end
endmodule