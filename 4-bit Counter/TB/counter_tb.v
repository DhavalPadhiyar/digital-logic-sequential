module counter_tb();
    reg clk = 0;
    reg rst;
    wire [3:0] count;

    // Instantiate counter
    counter DUT (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Generate 50 MHz clock
    always #10 clk = ~clk;

    initial begin
        $display("Start 4-bit Counter Test");
        rst = 1;
        #20;
        rst = 0;

        // Observe counter output for a few clock cycles
        repeat (20) begin
            #20;
            $display("Time = %0t | Count = %b", $time, count);
        end

        $finish;
    end
endmodule
