`timescale 1ns / 1ps

module tb_SIPO_Shift_Register;

    reg clk;
    reg rst;
    reg serial_in;
    wire [7:0] parallel_out;

    // Instantiate SIPO module
    SIPO_Shift_Register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        rst = 1;
        serial_in = 0;

        // Reset the shift register
        #10 rst = 0;

        // Send 8 bits: 1 0 1 1 0 0 1 1
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;

        // Wait and observe
        #20 $finish;
    end

endmodule
