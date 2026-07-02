module Encoder8to3(input[7:0] i, output[2:0] w);

    assign w[2] = i[4] | i[5] | i[6] | i[7];
    assign w[1] = i[2] | i[3] | i[6] | i[7];
    assign w[0] = i[1] | i[3] | i[5] | i[7];

endmodule

module Encoder4to2(input[3:0] i, output[1:0] w);

    assign w[1] = i[2] | i[3];
    assign w[0] = i[1] | i[3];

endmodule
