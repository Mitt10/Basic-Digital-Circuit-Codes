`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_graytobinary();
	reg[3:0] gray;
	wire [3:0] binary;
	
graytobinary UUT(.gray(gray), .binary(binary));

initial begin
	$monitor ("Gray = %b  --> Binary = %b", gray,binary);
	gray = 4'b1110;
	#5 gray = 4'b0100; 
	#5 gray = 4'b0111;
	#5 gray = 4'b1010;
    #5 gray = 4'b1000;
	#5 $finish;
end

endmodule