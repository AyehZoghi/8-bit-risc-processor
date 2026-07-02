`timescale 1ns/1ns
module ALU_tb;

    // Parameters

    // Ports
    reg clk;
    reg [7:0] a;
    reg [7:0]  b;
    reg [2:0] s;
    wire [7:0] out;
    wire co;

    ALU
        ALU_dut (
            .clk(clk),
            .a (a ),
            . b ( b ),
            .s (s ),
            .out (out ),
            .co  ( co)
        );

 always
  #5 clk=!clk;

    initial
    begin
    
        begin
            
            $dumpvars(0, ALU_tb);

            for (s = 3'b000; s < 3'b111; s = s + 1)
            
            begin               
                repeat(5)               
                begin
                    {a, b} = $random;
                    #10;
                end
               
            end
            if(s==3'b111)
            begin
            clk=0;           
            b=1; 
            clk=0; 
            a=4; #10; 
            a=9; #10; 
            a=16; #10; 
            a=25; #10; 
            a=36; #10; 
            a=49; #10; 
            a=64; #10; 
            a=81; #10; 
            a=160; #10; 
            a=121; #10; 
            a=144; #10; 
            end
           
            $finish;
        end
    end


endmodule
