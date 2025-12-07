module tb_8();
reg clk,rd;
reg add [2:0];
wire data_out [7:0];

RAM DUT(.clk(clk),.data_out(data_out),.add(add),.rd(rd));

initial begin
clk=0;
forever #5 clk= ~clk;
end  

initial begin
rd=1;
add=3'b000;
#10;

rd=1;
add=3'b001;
#10;

rd=1;
add=3'b010;
#10;

rd=1;
add=3'b011;
#10;

rd=1;
add=3'b100;
#10;

rd=1;
add=3'b101;
#10;

rd=1;
add=3'b110;
#10;

rd=1;
add=3'b111;
#10;

   

end

