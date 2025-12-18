module control_memory (
    input [3:0] addr,
    output reg [15:0] cw
);

    always @(*) begin
        case (addr)
            4'd0: cw = 16'b1_1_000_001_010_000;
            4'd1: cw = 16'b1_1_010_011_100_000;
            4'd2: cw = 16'b1_1_100_101_000_000;
            default: cw = 16'b0;
        endcase
    end

endmodule
