// 8-bit SIPO Shift Register
module SIPO_Shift_Register (
    input wire clk,        // Clock signal
    input wire rst,        // Synchronous reset
    input wire serial_in,  // Serial data input
    output reg [7:0] parallel_out  // Parallel data output
);

    always @(posedge clk) begin
        if (rst) begin
            parallel_out <= 8'b0;  // Reset output
        end else begin
            // Shift left and insert new bit at LSB
            parallel_out <= {parallel_out[6:0], serial_in};
        end
    end

endmodule
