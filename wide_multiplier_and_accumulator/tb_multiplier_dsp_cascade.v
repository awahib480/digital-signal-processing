// Test bench for multiplier dsp cascade

module tb_multiplier_dsp_cascade;

reg clk, reset;
reg signed [31:0] data_a, data_b;
wire signed [63:0] prod_out;

multiplier_dsp_cascade uut (
    .clk(clk),
    .reset(reset),
    .data_a(data_a),
    .data_b(data_b),
    .prod_out(prod_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    data_a = 0;
    data_b = 0;

    // Reset
    #10;
    reset = 0;

    // Test 1
    data_a = 32'sd10;
    data_b = 32'sd20;
    #10;

    // Test 2
    data_a = -32'sd15;
    data_b = 32'sd10;
    #10;

    // Test 3
    data_a = 32'sd1000;
    data_b = 32'sd2000;
    #10;

    // Test 4
    data_a = -32'sd100;
    data_b = -32'sd50;
    #10;

    // Wait for pipeline
    #30;

    $finish;
end

// Display output
initial begin
    $monitor("Time=%0t A=%0d B=%0d Product=%0d",
             $time, data_a, data_b, prod_out);
end

endmodule
