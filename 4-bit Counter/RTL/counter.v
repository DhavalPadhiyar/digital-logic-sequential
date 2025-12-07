module counter (clk,reset,count);
input clk;
input reset;
output [0:3]count;
 assign count=0;
always@(posedge clk)
 if (reset=1)
 count=4'b0000;
 else
 count=count+1'b1;
 endmodule