module tb_audio_accumulator;

reg clk, reset;
reg signed [15:0] audio_in;
wire signed [47:0] acc_out;

audio_accumulator uut (
    .clk(clk),
    .reset(reset),
    .audio_in(audio_in),
    .acc_out(acc_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    audio_in = 0;

    @(posedge clk); #1;
    $display("1: acc_out = %0d", acc_out);

    reset = 0;
    audio_in = 1000;
    @(posedge clk); #1;
    $display("2: acc_out = %0d", acc_out);

    audio_in = 2000;
    @(posedge clk); #1;
    $display("3: acc_out = %0d", acc_out);

    audio_in = -500;
    @(posedge clk); #1;
    $display("4: acc_out = %0d", acc_out);

    audio_in = 32767;
    @(posedge clk); #1;
    $display("5: acc_out = %0d", acc_out);

    audio_in = -32768;
    @(posedge clk); #1;
    $display("6: acc_out = %0d", acc_out);

    reset = 1;
    @(posedge clk); #1;
    $display("7: acc_out = %0d", acc_out);

    $finish;
end

endmodule