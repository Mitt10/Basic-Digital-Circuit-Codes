`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module mux_4x1(
	input [1:0] sel,
	input [3:0]i0,i1,i2,i3,
	output reg[3:0] y
);

always @(*)
begin
	y=0;
	case(sel)
		2'h0: y=i0;
		2'h1: y=i1;
		2'h2: y=i2;
		2'h3: y=i3;
		default: y=i0;
	endcase
end

endmodule