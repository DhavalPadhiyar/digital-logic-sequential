module siso (
    input clk,
    input rst,         
    input sin,          
    output sout         
);

    reg [3:0] shift_reg;

    assign sout = shift_reg[0];

    always @(posedge clk) begin
        if (rst)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {sin, shift_reg[3:1]}; 
    end

endmodule
