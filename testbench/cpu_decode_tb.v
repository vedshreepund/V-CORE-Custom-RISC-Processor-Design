`timescale 1ns/1ps

module cpu_decode_tb;

    reg clk;
    reg reset;

    cpu_top dut (
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        $display("Time PC Opcode rd rs1 rs2 imm regW aluSrc");
        $display("------------------------------------------------");

        #10 reset = 0;
        #100 $finish;
    end

    always @(posedge clk) begin
        $display("%0t %0d %b %0d %0d %0d %0d %b %b",
            $time,
            dut.pc_out,
            dut.opcode,
            dut.rd,
            dut.rs1,
            dut.rs2,
            dut.imm_i,
            dut.reg_write,
            dut.alu_src
        );
    end

endmodule
