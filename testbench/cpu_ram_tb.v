module cpu_ram_tb;
    reg clk = 0;
    reg reset = 1;

    cpu_top DUT (.clk(clk), .reset(reset));

    always #5 clk = ~clk;

    initial begin
        $display("TIME  ADDR  WRITE  DATA_IN  DATA_OUT");

        #10 reset = 0;

        #10;
        DUT.mem_write = 1'b1;
        DUT.mem_addr  = 2'd1;
        DUT.mem_data_in = 8'h3C;
        #10;
        $display("%4t   %d     %b      %h      %h",
            $time,
            DUT.mem_addr,
            DUT.mem_write,
            DUT.mem_data_in,
            DUT.mem_data_out
        );

        #10;
        DUT.mem_write = 1'b0;
        #10;
        $display("%4t   %d     %b      %h      %h",
            $time,
            DUT.mem_addr,
            DUT.mem_write,
            DUT.mem_data_in,
            DUT.mem_data_out
        );

        #10;
        DUT.mem_write = 1'b1;
        DUT.mem_addr  = 2'd3;
        DUT.mem_data_in = 8'hF0;
        #10;
        $display("%4t   %d     %b      %h      %h",
            $time,
            DUT.mem_addr,
            DUT.mem_write,
            DUT.mem_data_in,
            DUT.mem_data_out
        );

        #10;
        DUT.mem_write = 1'b0;
        #10;
        $display("%4t   %d     %b      %h      %h",
            $time,
            DUT.mem_addr,
            DUT.mem_write,
            DUT.mem_data_in,
            DUT.mem_data_out
        );

        $finish;
    end
endmodule
