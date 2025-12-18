module decoder_2to4 (
    input  wire [1:0] addr,
    input  wire       enable,
    output wire [3:0] word_sel
);
    assign word_sel = enable ? (4'b0001 << addr) : 4'b0000;
endmodule
