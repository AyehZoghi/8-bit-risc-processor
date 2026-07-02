module Counter(clk, rst, inc, out);
    input clk, rst, inc;
    output reg[2:0] out;
    always @(posedge clk) begin
        if (rst) out <= 3'b000;
        else if (inc) out <= out + 1;
    end
endmodule