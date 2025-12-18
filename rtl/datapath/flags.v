module flags (
    input clk,
    input reset,
    input flag_write,
    input z_in,
    input c_in,
    output reg z,
    output reg c
);

    always @(posedge clk) begin
        if (reset) begin
            z <= 0;
            c <= 0;
        end else if (flag_write) begin
            z <= z_in;
            c <= c_in;
        end
    end

endmodule
