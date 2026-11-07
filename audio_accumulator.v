module audio_accumulator (
    input clk,
    input reset,
    input signed [15:0] audio_in,

    (* use_dsp = "yes" *)
    output reg signed [47:0] acc_out
);

always @(posedge clk) begin
    if (reset)
        acc_out <= 48'sd0;
    else
        acc_out <= acc_out + {{32{audio_in[15]}}, audio_in};
end

endmodule