`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_binarytogray();
	reg[3:0] binary ;
	wire[3:0] gray;
	
	binarytogray UUT(.binary(binary), .gray(gray));
	
	initial begin
		$monitor("Binary = %b --> Gray = %b", binary, gray);
		binary = 4'b1011; #5;
		binary = 4'b0111; #5;
		binary = 4'b0101; #5;
		binary = 4'b1100; #5;
		binary = 4'b1111;
		#10 $finish;
	end
endmodule
