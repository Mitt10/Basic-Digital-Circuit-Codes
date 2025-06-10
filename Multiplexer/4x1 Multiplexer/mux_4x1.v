`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module mux_4x1(
	input [1:0] sel,
	input i0,i1,i2,i3,
	output reg y
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
//Alternative approach for 4x1 Multiplexer
//	assign y = (sel == 2'b00) ? i0 :
//			   (sel == 2'b01) ? i1 :
//			   (sel == 2'b10) ? i2 :
//			   (sel == 2'b11) ? i3 : i0;

endmodule
