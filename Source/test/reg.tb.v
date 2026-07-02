module Register_tb;

    // Parameters

    // Ports
    reg clk = 0;
    reg  ld = 0;
    reg  rst = 0;
    reg  inc = 0;
    reg [7:0] in;
    wire[7:0] out;

    Register8
        Register_dut (
            .clk (clk ),
            .in (in ),
            .ld ( ld ),
            .rst ( rst ),
            .inc ( inc ),            
            .out  ( out)
        );

    always #5 clk = ~clk;

    initial
    begin
        begin
            
            $dumpvars(0, Register_tb);
            in = $random;
            #15;
            ld = 1;
            #10;
            ld = 0;
            #20;
            inc = 1;
            #10; 
            inc = 0;
            #20;
            rst = 1;
            #10;
            rst = 0;
            #20;
            $finish;
        end
    end

endmodule


