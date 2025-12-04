module jkff_tb();
reg j;
reg k;
reg clk;
reg reset;
wire q;
wire q_b;

jkff DUT(.j(j),.k(k),.clk(clk),.reset(reset),.q(q),.q_b(q_b));
  initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
    reset=1;
    j=0;
    k=0;
    #5;

    reset=0;
    j=0;
    k=0;
    #5;

    reset=0;
    j=0;
    k=1;
    #5;

    reset=0;
    j=1;
    k=0;
    #5;

    reset=0;
    j=1;
    k=1;
    #5;

    end 
    endmodule

