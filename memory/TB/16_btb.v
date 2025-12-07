module tb_8;

reg clk;
reg wr, rd;
reg [3:0] add;
reg [15:0] data_in;
wire [15:0] data_out;

RAM DUT (
  .clk(clk),
  .data_in(data_in),
  .data_out(data_out),
  .add(add),
  .rd(rd),
  .wr(wr)
);

initial begin
  clk = 0;
  forever #5 clk = ~clk;
end  

initial begin
  wr = 1;
  add = 4'b0100;
  data_in = 8'hA5;
  rd = 0;
  #5;

  rd = 1;
  add = 4'b0100;
  #10;
end

endmodule
