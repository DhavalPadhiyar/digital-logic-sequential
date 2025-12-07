`timescale 1ns / 1ps

module tb_PISO_Shift_Register;

    reg clk, rst, load;
    reg [7:0] parallel_in;
    wire serial_out;

    PISO_Shift_Register uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Init
        clk = 0;
        rst = 1;
        load = 0;
        parallel_in = 8'b0;

        // Reset
        #10 rst = 0;

        // Load parallel data
        #10 load = 1;
            parallel_in = 8'b11010110;

        #10 load = 0;

        // Shift out data bit-by-bit
        repeat (8) #10;

        $finish;
    end

endmodule
