module loadable_counter(count, load, rst,clk,up,down,opnd);
input reset,up,down,opnd;
input [3:0]load;
input clk;
output [3:0] count;
parameter up=1'b1;
        down=1'b0;

always @(posedge clk or posedge rst) begin
if (rst)
 count <=0;
else if(opnd)
     if(count<=load)
     count= count+1;
else if(opnd)
     if(count>load)
     count= count-1
  endcase
  end 
  endmodule



 
   
