module shifter (
    input [7:0] in,
    input [1:0] sel,
    output reg [7:0] out
);

    always @(*) begin
        case (sel)
            2'b00: out = in;
            2'b01: out = in << 1;
            2'b10: out = in >> 1;
            2'b11: out = {in[6:0], in[7]};
        endcase
    end

endmodule
