module siso_tb;
reg rst,clk,sin;
wire sout;

siso DUT(.rst(rst),.clk(clk),.sin(sin),.sout(sout));

 initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
 initial begin

 rst=1;
 #20;

 rst=0;
 #20;

 sin=1;
 #20;

 sin=0;
 #20;

 sin=1;
#20;

sin=1;
#20;
end
$finish;
endmodule