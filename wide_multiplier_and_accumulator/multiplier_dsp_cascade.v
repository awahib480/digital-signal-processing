// 32-bit Pipelined Cascaded Multiplier (Multi-DSP Map Loop)

module multiplier_dsp_cascade (
    input clk,
    input reset,
    input signed [31:0] data_a,
    input signed [31:0] data_b,
    output reg signed [63:0] prod_out
);

// Split operands into signed high and unsigned low halves
wire signed [16:0] a_hi = {data_a[31], data_a[31:16]};
wire signed [16:0] a_lo = {1'b0, data_a[15:0]};

wire signed [16:0] b_hi = {data_b[31], data_b[31:16]};
wire signed [16:0] b_lo = {1'b0, data_b[15:0]};

// Four partial products
(* use_dsp = "yes" *) reg signed [33:0] pp_hh;
(* use_dsp = "yes" *) reg signed [33:0] pp_hl;
(* use_dsp = "yes" *) reg signed [33:0] pp_lh;
(* use_dsp = "yes" *) reg signed [33:0] pp_ll;

// Pipeline registers
reg signed [34:0] cross_sum;
reg signed [63:0] sum_stage;
reg signed [33:0] ll_stage;

// Stage 1: Calculate partial products
always @(posedge clk) begin
    if (reset) begin
        pp_hh <= 0;
        pp_hl <= 0;
        pp_lh <= 0;
        pp_ll <= 0;
    end
    else begin
        pp_hh <= a_hi * b_hi;
        pp_hl <= a_hi * b_lo;
        pp_lh <= a_lo * b_hi;
        pp_ll <= a_lo * b_lo;
    end
end

// Stage 2: Combine high and cross products
always @(posedge clk) begin
    if (reset) begin
        cross_sum <= 0;
        sum_stage <= 0;
        ll_stage <= 0;
    end
    else begin
        cross_sum <= pp_hl + pp_lh;

        sum_stage <=
            ({{30{pp_hh[33]}}, pp_hh} << 32) +
            ({{29{(pp_hl + pp_lh)[33]}}, (pp_hl + pp_lh)} << 16);

        ll_stage <= pp_ll;
    end
end

// Stage 3: Final product
always @(posedge clk) begin
    if (reset)
        prod_out <= 0;
    else
        prod_out <= sum_stage + {{30{ll_stage[33]}}, ll_stage};
end

endmodule
