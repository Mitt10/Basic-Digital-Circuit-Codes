`timescale 1ns / 1ps

module full_sub(
	 input a,b,bin,
	 output diff, borrow

);


assign diff = a ^ b ^ bin;
assign borrow = (~a & (b ^ bin)) | (bin & b);
endmodule
