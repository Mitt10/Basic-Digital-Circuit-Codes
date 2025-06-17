`timescale 1ns / 1ps

module tb_demux_1x4();
	reg i;
	reg[1:0] sel;
	wire y0,y1,y2,y3;
	
	demux_1x4 UUT(.sel(sel), .i(i), .y0(y0), .y1(y1), .y2(y2), .y3(y3));
	
	initial begin
		sel=2'b00;i=0;
		#5 sel=2'b00;i=1;
		#5 sel=2'b01;i=0;
		#5 sel=2'b01;i=1;
		#5 sel=2'b10;i=0;
		#5 sel=2'b10;i=1;
		#5 sel=2'b11;i=0;
		#5 sel=2'b11;i=1;
		#10 $finish();
	end
endmodule
