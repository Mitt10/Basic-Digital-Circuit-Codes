`timescale 1ns / 1ps


module demux_1x2(
	input i,sel,
	//for asssign use-> output y0,y1;
	output reg y0,y1
);


//assign {y0,y1} = sel?{1'b0,i} : {i,1'b0};


//using if statement

//always @(*)
//begin
//    y0 = 0;  // default assignment
//    y1 = 0;  // default assignment

//    if (sel == 1'b0)
//        y0 = i;
//    else
//        y1 = i;
//end

//using case statements

always @(*)
begin
	y0=0;y1=0;
	case(sel)
		1'b0 : y0 = i;
		1'b1: y1 = i;
		default: y0=i;
	endcase
end

endmodule
