module instruction_register (
    input clk,
    input load,
    input [7:0] in,
    output reg [7:0] out
);

    always @(posedge clk) begin
        if (load)
            out <= in;
    end

endmodule
