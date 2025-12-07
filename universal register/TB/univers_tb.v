`timescale 1ns / 1ps

module tb_universal_shift_register;

    reg clk, rst;
    reg [2:0] mode;
    reg serial_in;
    reg [7:0] parallel_in;
    wire [7:0] q;
    wire serial_out;

    universal_shift_register uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .serial_in(serial_in),
        .parallel_in(parallel_in),
        .q(q),
        .serial_out(serial_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; serial_in = 0; mode = 3'b000; parallel_in = 8'b0;

        #10 rst = 0;

        // Test PIPO load
        mode = 3'b001; parallel_in = 8'b10101010; #10;

        // Test SISO
        mode = 3'b000; serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;

        // Test SIPO
        mode = 3'b010; serial_in = 1; #10;
        serial_in = 1; #10;

        // Test PISO
        mode = 3'b011; parallel_in = 8'b11110000; #10;

        // Test SR
        mode = 3'b100; serial_in = 0; #10;
        serial_in = 1; #10;

        // Test SL
        mode = 3'b101; serial_in = 1; #10;
        serial_in = 0; #10;

        // Test ROR
        mode = 3'b110; #10;
        #10;

        // Test ROL
        mode = 3'b111; #10;
        #10;

        $finish;
    end

endmodule
