module jkff_dff(j,k,d,reset,clk);
input j,k,d,reset,clk;
outpot reg q;


    wire d;
   assign d = (j & ~q) | (~k & q);

    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end

