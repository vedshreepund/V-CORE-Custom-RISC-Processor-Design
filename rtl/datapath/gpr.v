module gpr (
    input clk,
    input reset,
    input reg_write,
    input [2:0] sel_a,
    input [2:0] sel_b,
    input [2:0] sel_d,
    input [7:0] data_in,
    output [7:0] bus_a,
    output [7:0] bus_b
);

    reg [7:0] r[0:7];

    integer i;

    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                r[i] <= 0;
        end else if (reg_write) begin
            r[sel_d] <= data_in;
        end
    end

    assign bus_a = r[sel_a];
    assign bus_b = r[sel_b];

endmodule
