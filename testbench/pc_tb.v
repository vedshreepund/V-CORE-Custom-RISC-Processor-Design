`timescale 1ns/1ps

module pc_tb;

    reg clk;
    reg reset;
    wire [31:0] pc_out;

    wire [31:0] pc_next = pc_out + 4;

    pc dut (
        .clk(clk),
        .reset(reset),
        .pc_next(pc_next),
        .pc_out(pc_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        $display("Time(ns)\tReset\tPC");
        $display("---------------------------");

        #10 reset = 0;   // release reset

        #100 $finish;
    end

    // Print PC at every rising edge
    always @(posedge clk) begin
        $display("%0t\t%b\t%0d", $time, reset, pc_out);
    end

endmodule
