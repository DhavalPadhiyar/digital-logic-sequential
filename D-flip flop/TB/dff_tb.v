module dff_tb();
reg clk;
reg d; 
reg reset;
wire q;

    dff DUT (.clk(clk), .reset(reset), .d(d), .q(q), .q_bar(q_bar));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        
        reset = 1;
        d = 0;
        #10;

        reset = 0;
        d = 0;
        #10;

        d = 1;
        #10;

        d = 0;
        #10;

        $finish;
    end
endmodule
