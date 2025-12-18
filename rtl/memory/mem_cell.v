module mem_cell (
    input  wire select,     // word line
    input  wire write_en,
    input  wire data_in,
    output wire data_out
);
    reg q;

    always @(*) begin
        if (select && write_en)
            q = data_in;
    end

    assign data_out = (select) ? q : 1'b0;
endmodule
