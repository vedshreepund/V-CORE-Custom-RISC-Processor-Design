module cpu_top (
    input clk,
    input reset,
    input [7:0] instr
);

    wire [7:0] ir_out;
    wire [3:0] uaddr;
    wire [15:0] cw;

    wire reg_write, flag_write;
    wire [2:0] sel_a, sel_b, sel_d, alu_op;
    wire [7:0] bus_a, bus_b, alu_out;
    wire z_alu, c_alu;

    instruction_register IR (
        .clk(clk),
        .load(1'b1),
        .in(instr),
        .out(ir_out)
    );

    micro_sequencer MS (
        .clk(clk),
        .reset(reset),
        .opcode(ir_out),
        .uaddr(uaddr)
    );

    control_memory CM (
        .addr(uaddr),
        .cw(cw)
    );

    cu CU (
        .cw(cw),
        .reg_write(reg_write),
        .flag_write(flag_write),
        .sel_a(sel_a),
        .sel_b(sel_b),
        .sel_d(sel_d),
        .alu_op(alu_op)
    );

    gpr RF (
        .clk(clk),
        .reset(reset),
        .reg_write(reg_write),
        .sel_a(sel_a),
        .sel_b(sel_b),
        .sel_d(sel_d),
        .data_in(alu_out),
        .bus_a(bus_a),
        .bus_b(bus_b)
    );

    alu ALU (
        .a(bus_a),
        .b(bus_b),
        .opr(alu_op),
        .y(alu_out),
        .z(z_alu),
        .c(c_alu)
    );

    flags FLAGS (
        .clk(clk),
        .reset(reset),
        .flag_write(flag_write),
        .z_in(z_alu),
        .c_in(c_alu),
        .z(),
        .c()
    );

endmodule
