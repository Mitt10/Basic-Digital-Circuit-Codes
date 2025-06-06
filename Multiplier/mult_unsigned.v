// Unsigned 16x24-bit Multiplier
// parameterized latency stages of Multiplier


module mult_unsigned #(
		parameter WIDTHA = 16,
		parameter WIDTHB = 24,
		parameter PIPELINE_DEPTH = 4
)
(
	input clk,rst,
	input [WIDTHA -1 :0] A,
	input [WIDTHB -1 :0] B,
	output [WIDTHA + WIDTHB - 1:0] result
);

reg [WIDTHA -1 :0] rA;
reg [WIDTHB -1 :0] rB;
reg [WIDTHA + WIDTHB - 1:0] M [PIPELINE_DEPTH-1:0];

integer i;

always @(posedge clk or posedge rst)
begin
	if (rst) begin
		rA <= 0;
		rB <= 0;
		for (i=0; i<PIPELINE_DEPTH; i=i+1)
		  M[i] <=0;
		end
	else
	begin
		rA <= A;
		rB <= B;
		M[0] <= rA * rB;

		for (i=0; i<PIPELINE_DEPTH-1; i=i+1)
			M[i+1] <= M[i];
	end
end

assign result = M[PIPELINE_DEPTH-1];
endmodule