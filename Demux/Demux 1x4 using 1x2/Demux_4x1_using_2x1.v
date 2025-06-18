`timescale 1ns / 1ps

module demuxx_1x2(
	input i,sel,
	output y0,y1
);

assign {y0,y1} = sel?{1'b0,i} : {i,1'b0};

endmodule

module demuxx_1x4(
	input i,
	input[1:0] sel,
	output y0,y1,y2,y3
);

wire Z1,Z2;

demuxx_1x2 D0 (i,sel[1],Z1,Z2);
demuxx_1x2 D1(Z1,sel[0],y0,y1);
demuxx_1x2 D2 (Z2,sel[0],y2,y3);

endmodule
