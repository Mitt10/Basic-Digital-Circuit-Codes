`timescale 1ns / 1ps
module tb_demux_1x2();
	reg i,sel;
	wire y0,y1;
	
	demux_1x2 UUT(i,sel,y0,y1);
	
	initial begin
		$monitor("Sel=%b, i=%b  --> y0 = %b, y1 = %b", sel,i,y0,y1);
		sel=0;i=0;
		#10 sel=0;i=1;
		#10 sel=1;i=0;
		#10 sel=1;i=1;
		#10 $finish;
	end
endmodule
