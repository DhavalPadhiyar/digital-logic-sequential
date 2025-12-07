module PISO_Shift_Register (
    input wire clk,             // Clock input
    input wire rst,             // Synchronous reset
    input wire load,            // Load signal
    input wire [7:0] parallel_in, // 8-bit parallel input
    output reg serial_out       // Serial output (MSB or LSB first)
);

    reg [7:0] shift_reg;        // Internal shift register

    always @(posedge clk) begin
        if (rst) begin
            shift_reg <= 8'b0;
            serial_out <= 1'b0;
        end else if (load) begin
            shift_reg <= parallel_in;     // Load parallel data
        end else begin
            serial_out <= shift_reg[7];   // Output MSB (you can change to LSB)
            shift_reg <= shift_reg << 1;  // Shift left (MSB first)
        end
    end

endmodule
