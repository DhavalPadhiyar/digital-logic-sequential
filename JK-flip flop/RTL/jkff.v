module jk_ff (clk,reset,j,k,q,q_b);
    input clk,
    input reset,
    input j,
    input k,
    output reg q,
    output q_b
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else begin
            case ({j, k})
                2'b00: q <= q;         // No change
                2'b01: q <= 0;         // Reset
                2'b10: q <= 1;         // Set
                2'b11: q <= ~q;        // Toggle
            endcase
        end
    end

    assign q_b = ~q;

endmodule
