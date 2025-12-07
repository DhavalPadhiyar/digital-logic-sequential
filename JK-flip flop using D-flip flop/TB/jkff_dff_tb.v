module jkff_dff(
    input j,
    input k,
    input reset,
    input clk,
    output reg q
);

    wire d;
    // JK to D conversion logic
    assign d = (j & ~q) | (~k & q);

    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule
