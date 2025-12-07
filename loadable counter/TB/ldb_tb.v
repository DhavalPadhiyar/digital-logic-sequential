module loadable_tb();
reg rst;
reg clk=0;
reg [0:3]load;
wire [0:3]count;

parameter up= 1'b1;
parameter down=1'b0;

loadable_counter DUT(.clk(clk),.rst(rst),.count(count),.load(load),.opnd(opnd));

initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

initial begin
 
 rst=1;
 #20;
 rst=0;
 #20;
 
 opnd=up;
 load=4'b0101;

 rst=1;
 #20;
 rst=0;
 #20;

opnd=down;
load=4'b0101;

rst=1;
#10;

 end
 endmodule



