module counter_4bit_tb;
    reg clk = 0;
    reg rst;
    reg up_down;
    wire [3:0] count;

    // Instantiate counter
    counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .count(count),
        .up_down(up_down)
    );

    // Generate 50 MHz clock
    always #10 clk = ~clk;

    initial begin
        $display("Start 4-bit Counter Test");
        rst = 1;
        #20;
        rst = 0;up_down=1;

        // Observe counter output for a few clock cycles
        repeat (20) begin
            #20;
            $display("Time = %0t | Count = %b", $time, count);
        end

          rst = 0;up_down=0;

        // Observe counter output for a few clock cycles
        repeat (20) begin
            #20;
            $display("Time = %0t | Count = %b", $time, count);
        end

        $finish;
    end
endmodule
