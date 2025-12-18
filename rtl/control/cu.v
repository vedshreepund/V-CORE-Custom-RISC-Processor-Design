module cu (
    input [15:0] cw,
    output reg_write,
    output flag_write,
    output [2:0] sel_a,
    output [2:0] sel_b,
    output [2:0] sel_d,
    output [2:0] alu_op
);

    assign reg_write  = cw[15];
    assign flag_write = cw[14];
    assign sel_a      = cw[13:11];
    assign sel_b      = cw[10:8];
    assign sel_d      = cw[7:5];
    assign alu_op     = cw[4:2];

endmodule
