module universal_shift_register (
    input wire clk,
    input wire rst,
    input wire [2:0] mode,        
    input wire serial_in,          
    input wire [7:0] parallel_in,  
    output reg [7:0] q,            
    output wire serial_out         
);

   
    localparam SISO = 3'b000;
    localparam PIPO = 3'b001;
    localparam SIPO = 3'b010;
    localparam PISO = 3'b011;
    localparam SR   = 3'b100;
    localparam SL   = 3'b101;
    localparam ROR  = 3'b110;
    localparam ROL  = 3'b111;

    assign serial_out = q[0];  // we can change to MSB if needed

    always @(posedge clk) begin
        if (rst) begin
            q <= 8'b0;
        end else begin
            case (mode)
                SISO: begin
                    q <= {serial_in, q[7:1]}; // Shift right 
                end

                PIPO: begin
                    q <= parallel_in; // Load all at once
                end

                SIPO: begin
                    q <= {serial_in, q[7:1]}; // Shift right, keep observing q
                end

                PISO: begin
                    q <= parallel_in; // Load in parallel
                end

                SR: begin
                    q <= {serial_in, q[7:1]}; // Shift right with serial in
                end

                SL: begin
                    q <= {q[6:0], serial_in}; // Shift left with serial in
                end

                ROR: begin
                    q <= {q[0], q[7:1]}; // Rotate right
                end

                ROL: begin
                    q <= {q[6:0], q[7]}; // Rotate left
                end

                default: q <= q;
            endcase
        end
    end

endmodule
