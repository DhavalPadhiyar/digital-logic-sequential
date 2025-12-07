module (clk,reset,count,up_down);
input clk;
input reset;
input up_down;
output [0:3]count;
always@(posedge clk)
 if (reset=1)
 count=4'b0000;
 else if(reset==0 && up_down==1)begin
 count=count+1'b1;
 end
 else if(reset==0 && up_down==0)
 begin
 count=count-1'b1;
 end
 endmodule