`timescale 1ns / 1ps

module full_add(
	input a,b,cin,
	output sum,cout
);

assign {sum,cout} = {a^b^cin, (a & b) | (b & cin) | (a & cin)};

endmodule

module ripple_carry_add_sub #(parameter SIZE = 4) (
	input [SIZE-1:0]A,B,
	input CTRL,
	output [SIZE-1:0] Sum, Cout
); 

wire [SIZE-1:0] Bc;
assign Bc[0] = B[0] ^ CTRL;
full_add F0(A[0], Bc[0], CTRL, Sum[0], Cout[0]);
genvar g;

generate
	for (g=1; g<SIZE; g=g+1)
	begin
		assign Bc[g] = B[g] ^ CTRL;
		full_add FA (A[g], Bc[g], Cout[g-1], Sum[g], Cout[g]);
	end
endgenerate

endmodule
