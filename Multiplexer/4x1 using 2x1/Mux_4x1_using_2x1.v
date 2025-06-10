`timescale 1ns / 1ps

module muxx_2x1(
	input sel,
	input i0,i1,
	output y
);

assign y = sel ? i1:i0;
endmodule

module muxx_4x1(
	input i0,i1,i2,i3,
	input sel1,sel0,
	output y
);

wire y0,y1;

muxx_2x1 M1(sel1,i0,i1,y0);
muxx_2x1 M2(sel1,i2,i3,y1);
muxx_2x1 M3(sel0,y0,y1,y);


endmodule