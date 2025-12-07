module counter12_tb;
    reg clk = 0;
    reg rst;
    wire [3:0] count;

    // Instantiate counter
    counter12 uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end


    initial begin
        $display("Start modulo 12 Counter Test");
        rst = 1;
        #20;
        rst = 0;

        
        repeat (24) begin
            #20;
            $display("Time = %0t | Count = %b", $time, count);
        end

        $finish;
    end
endmodule
