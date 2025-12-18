module micro_sequencer (
    input clk,
    input reset,
    input [7:0] opcode,
    output reg [3:0] uaddr
);

    always @(posedge clk) begin
        if (reset)
            uaddr <= 0;
        else
            case (opcode)
                8'h01: uaddr <= 4'd0;
                8'h02: uaddr <= 4'd1;
                8'h03: uaddr <= 4'd2;
                default: uaddr <= 4'd0;
            endcase
    end

endmodule
