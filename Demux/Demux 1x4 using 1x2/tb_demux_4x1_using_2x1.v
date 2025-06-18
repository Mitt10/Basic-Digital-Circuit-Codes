`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_demux_4x1_2x1();
	reg i;
	reg[1:0] sel;
	wire y0,y1,y2,y3;
	
	demuxx_1x4 UUT (i,sel,y0,y1,y2,y3);
	
	initial begin
		$monitor("i = %b, sel = %2b --> y0=%b, y1=%b, y2=%b, y3=%b", i,sel,y0,y1,y2,y3);
		sel=2'b00;i=0;
		#5 sel=2'b00;i=1;
		#5 sel=2'b01;i=0;
		#5 sel=2'b01;i=1;
		#5 sel=2'b10;i=0;
		#5 sel=2'b10;i=1;
		#5 sel=2'b11;i=0;
		#5 sel=2'b11;i=1;
		#5 $finish();
	end
endmodule
