`timescale 1ns/1ps

module cpu_fetch_tb;

    reg clk;
    reg reset;

    cpu_top dut (
        .clk(clk),
        .reset(reset)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        $display("Time(ns)\tPC\tInstruction");
        $display("----------------------------------------");

        #10 reset = 0;   // release reset
        #100 $finish;
    end

    // Print fetch result every cycle
    always @(posedge clk) begin
        $display("%0t\t%0d\t0x%08h",
                 $time,
                 dut.pc_out,
                 dut.instruction);
    end

endmodule
