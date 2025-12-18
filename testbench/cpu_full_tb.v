module cpu_full_tb;

    reg clk = 0;
    reg reset = 1;
    reg [7:0] instr;

    cpu_top DUT (
        .clk(clk),
        .reset(reset),
        .instr(instr)
    );

    always #5 clk = ~clk;

    initial begin
        $display("===== CPU FULL FUNCTIONAL TEST =====");

        #10 reset = 0;

        DUT.RF.r[0] = 8'h00;
        DUT.RF.r[1] = 8'h05;
        DUT.RF.r[2] = 8'h03;
        DUT.RF.r[3] = 8'h00;
        DUT.RF.r[4] = 8'h00;
        DUT.RF.r[5] = 8'h00;

        $display("\n--- GPR READ TEST ---");
        #1;
        $display("R1=%h R2=%h", DUT.RF.r[1], DUT.RF.r[2]);

        $display("\n--- ALU ADD TEST (opcode 01) ---");
        instr = 8'h01;
        #10;
        $display("Expected R3 = 08, Actual R3 = %h", DUT.RF.r[3]);

        $display("\n--- ALU SUB TEST (opcode 02) ---");
        instr = 8'h02;
        #10;
        $display("Expected R4 = 05, Actual R4 = %h", DUT.RF.r[4]);

        $display("\n--- ALU AND TEST (opcode 03) ---");
        instr = 8'h03;
        #10;
        $display("Expected R5 = 01, Actual R5 = %h", DUT.RF.r[5]);

        $display("\n--- FLAG TEST ---");
        $display("Z flag = %b, C flag = %b", DUT.FLAGS.z, DUT.FLAGS.c);

        $display("\n--- MICROSEQUENCER TEST ---");
        instr = 8'h01; #10;
        $display("Opcode 01 -> uaddr = %d", DUT.MS.uaddr);
        instr = 8'h02; #10;
        $display("Opcode 02 -> uaddr = %d", DUT.MS.uaddr);
        instr = 8'h03; #10;
        $display("Opcode 03 -> uaddr = %d", DUT.MS.uaddr);

        $display("\n--- CONTROL WORD TEST ---");
        $display("Control Word = %b", DUT.CM.cw);

        $display("\n===== ALL TESTS COMPLETED =====");
        $finish;
    end

endmodule
