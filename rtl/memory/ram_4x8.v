module ram_4x8 (
    input  wire        clk,
    input  wire        mem_en,
    input  wire        write_en,
    input  wire [1:0]  addr,
    input  wire [7:0]  data_in,
    output wire [7:0]  data_out
);
    wire [3:0] word_sel;
    wire [7:0] cell_out [3:0];

    decoder_2to4 DEC (
        .addr(addr),
        .enable(mem_en),
        .word_sel(word_sel)
    );

    genvar i, j;
    generate
        for (i = 0; i < 4; i = i + 1) begin : WORDS
            for (j = 0; j < 8; j = j + 1) begin : BITS
                mem_cell CELL (
                    .select(word_sel[i]),
                    .write_en(write_en),
                    .data_in(data_in[j]),
                    .data_out(cell_out[i][j])
                );
            end
        end
    endgenerate

    assign data_out =
        cell_out[0] |
        cell_out[1] |
        cell_out[2] |
        cell_out[3];
endmodule
