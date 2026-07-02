module Sqrt(  input clk,
  input [7:0] in,
  output reg [7:0] out);
  reg [7:0] temp = 1;
  wire [7:0] powerout;
  wire [7:0] compareout;


  power2 power(temp,powerout);
  signed_comparator compare(compareout,powerout,in);

  always @(posedge clk) 
  begin
    if ((compareout) == 1)      out = temp;
    else if((compareout) == 2)  out = temp-1;
    else if (temp < 255)      temp = temp + 1;
  end
endmodule

module TB_Sqrt;  
  reg clk;
  reg [7:0]in;  
  wire [7:0]out;
  Sqrt SQRT(clk,in,out);

  initial
  begin
    clk=0;
    in=5; #30;
    in=11;#30;
    in=19; #30;
    in=35; #30;
    in=39; #30;
    in=50; #30;
    in=69; #30;
    in=89; #30;
    in=109; #30;
    in=126; #30;
    in=149; #30;

  end
  always
  #5 clk=!clk;
endmodule


