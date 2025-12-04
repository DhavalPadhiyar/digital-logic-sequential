module dff (
    input clk,
    input reset,     
    input d,
    output reg q,
    output q_bar
);
   always@(posedge clk)
   begin
   if(reset==1)
   q <= 0;
 else 
   q <= d;

   end
 assign q_bar= ~q; 
endmodule
