`timescale 1ns/1ps

module imem_tb;

    reg  [31:0] addr;
    wire [31:0] instruction;

    instruction_memory dut (
        .addr(addr),
        .instruction(instruction)
    );

    initial begin
        $display("Time(ns)\tAddress\tInstruction");
        $display("----------------------------------------");

        addr = 32'd0;   #10;
        $display("%0t\t%0d\t0x%08h", $time, addr, instruction);

        addr = 32'd4;   #10;
        $display("%0t\t%0d\t0x%08h", $time, addr, instruction);

        addr = 32'd8;   #10;
        $display("%0t\t%0d\t0x%08h", $time, addr, instruction);

        addr = 32'd12;  #10;
        $display("%0t\t%0d\t0x%08h", $time, addr, instruction);

        $finish;
    end

endmodule
