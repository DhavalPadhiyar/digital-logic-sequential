module tb_8();
reg clk,wr,rd;
reg add [2:0];
wire data_in, data_out [7:0];

RAM DUT(.clk(clk),.data_in(data_in),.data_out(data_out),.add(add),.rd(rd),.wr(wr));

initial begin
clk=0;
forever #5 clk= ~clk;
end  

initial begin
wr=1;
add=2'b010;
data_in=8'hA5;
rd=0;
#5;

rd=1;
add=2'b010;
#10;


   

end

