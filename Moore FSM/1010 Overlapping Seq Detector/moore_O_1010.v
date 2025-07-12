`timescale 1ns / 1ps


module moore_O_1010(
	input clk,rst,x,
	output reg z
);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
  parameter E = 4'h5;

reg [2:0] cs,ns;

always @(posedge clk or negedge rst)
begin
	if (!rst)
		cs <= A;
	else
		cs <= ns;
end 

always @(cs, x)
begin
	case (cs)
		A: begin
			if (x==1)
				ns = B;
			else
				ns = A;
		end
		B: begin
			if (x==0)
				ns = C;
			else
				ns = B;
		end
		C: begin
			if (x==1)
				ns = D;
			else
				ns = A;
		end
		D: begin
			if (x==0)
				ns = E;
			else
				ns = B;
		end
		E: begin
			if (x==0)
				ns = A;
			else
				ns = D;
		end
		default: ns = A;
	endcase
end

always @(cs)
begin
	case (cs)
		A: z=0;
		B: z=0;
		C: z=0;
		D: z=0;
		E: z=1;
		default: z=0;
	endcase
end

endmodule
