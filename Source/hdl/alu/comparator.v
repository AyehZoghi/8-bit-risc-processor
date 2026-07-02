module signed_comparator(out,A,B);

output reg[7:0] out;
//output reg equal;
//output reg less;
input signed [7:0] A;
input signed [7:0] B;

always @(A or B) begin
    if (A == B) begin   

	//equal out=00000001
	out=8'b0000000000001;

    end else if (A > B) begin  

	//greater than out=00000010
	out=8'b0000000000010;

    end else begin

	//lesser than out=00000100
	out=8'b0000000000100;

    end
end

endmodule


module comparator_testbench;

wire [7:0 ]out;

reg signed [7:0] A;
reg signed [7:0] B;

signed_comparator comparator(out,A,B);

initial 
            begin               
                repeat(5)               
                begin
                    {A, B} = $random;
                    #10;
                end
               
            end
endmodule




