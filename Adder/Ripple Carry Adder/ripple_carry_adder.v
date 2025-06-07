`timescale 1ns / 1ps

module full_adder(
	input a,b,cin,
	output sum,cout
);

assign {sum, cout} = {(a ^ b ^ cin), ((a & b) | (b & cin) | (a & cin))};

endmodule 

module ripple_carry_adder #(parameter SIZE =4)(
	input [SIZE -1:0] A,B,
	input Cin,
	output [SIZE -1:0] Sum, Cout
);

full_adder FA0(A[0], B[0], Cin, Sum[0], Cout[0]);

genvar g;
generate
	for (g=1; g<SIZE;g=g+1) begin
        full_adder fa(A[g], B[g], Cout[g-1], Sum[g], Cout[g]);	
    end

endgenerate

endmodule