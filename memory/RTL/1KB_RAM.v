 `timescale 1ns/1ps

 module RAM(clk,data_in,wr,rd,add,data_out);

input clk;
input [7:0] data_in;
input wr;
input rd;
input [9:0] add;
output [7:0] data_out;

reg[7:0] ram [0:1023];

always @(posedge clk)
begin
if (wr)
ram[add]<=data_in;
end
assign data_out=rd?ram[add]:8'bzzzzzzzz;
endmodule  