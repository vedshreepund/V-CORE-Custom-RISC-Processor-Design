module alu (
    input [7:0] a,
    input [7:0] b,
    input [2:0] opr,
    output reg [7:0] y,
    output z,
    output c
);

    reg [8:0] temp;

    always @(*) begin
        temp = 0;
        case (opr)
            3'b000: temp = a + b;
            3'b001: temp = a - b;
            3'b010: temp = a & b;
            3'b011: temp = a | b;
            3'b100: temp = a ^ b;
            3'b101: temp = b << 1;
            3'b110: temp = b >> 1;
            default: temp = 0;
        endcase
        y = temp[7:0];
    end

    assign z = (y == 0);
    assign c = temp[8];

endmodule
