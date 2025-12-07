 `timescale 1ns/1ps

 module ROM(clk,rd,add,data_out);

input clk;
input rd;
input [2:0] add;
output reg [7:0] data_out;

reg[7:0] rom [0:7];

always @(posedge clk)
begin
if (rd)
data_out<=rom[add];
end

initial begin
rom[0]=8'd18;
rom[1]=8'd11;
rom[2]=8'd04;
rom[3]=8'd22;
rom[4]=8'd02;
rom[5]=8'd20;
rom[6]=8'd11;
rom[7]=8'd10;

endmodule  