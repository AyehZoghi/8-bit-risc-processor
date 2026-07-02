module power2(input [7:0] num, output reg [7:0] result);

  reg [7:0] temp;
integer i;

  always @(*) begin
    temp = num;
    for (i = 0; i < num-1; i = i + 1) begin
      temp = temp +num ;
    end
    result = temp;
  end

endmodule


module tbPow2;

reg [7:0] in;
wire[7:0] out;
power2 power(in,out);

initial
begin 

in=2;
#20;
in=4;
#20;
in=5;
#20;

end



endmodule

