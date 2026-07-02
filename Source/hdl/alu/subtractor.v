module Subtractor(a, b, ci, out, co);
    input[7:0] a, b;
    input ci;
    output[7:0] out;
    output co;
    
    assign {co, out} = a + ~b + ci;

endmodule

module subtractor_testbench();
wire [7:0]out;
wire co;
reg [7:0] a,b;
Subtractor sub(a, b, 1'b1, out, co); //(a, b,1'b0, out, borrow);
initial 
begin 
//a = 15 , b=10
a = 8'b00001111;        
b = 8'b00001010;
#10;
//a=10 , b=15
a = 8'b00001010;        
b = 8'b00001111;#10;
end 
endmodule