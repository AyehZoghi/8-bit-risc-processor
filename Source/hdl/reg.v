module Register8(clk, in, ld, rst, inc, out);
    input clk, ld, rst, inc;
    input[7:0] in;
    output reg[7:0] out;

    always @(posedge clk) begin
        if (rst) out <= 8'b0;
        else if (ld) out <= in;
        else if (inc) out <= out + 1;
    end

endmodule

module Register4(clk, in, ld, rst, inc, out);
    input clk, ld, rst, inc;
    input[3:0] in;
    output reg[3:0] out;

    always @(posedge clk) begin
        if (rst) out <= 4'b0;
        else if (ld) out <= in;
        else if (inc) out <= out + 1;
    end

endmodule