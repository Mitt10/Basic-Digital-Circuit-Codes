`timescale 1ns / 1ps

module synchronous_counter #(parameter SIZE=4)(
	input clk,rst,
	input up,
	output reg [SIZE-1:0] count
);

always @(posedge clk)
begin
	if(!rst)
		count <=0;
	else
	begin
		if(up)
			count <= count + 1;
		else
			count <= count - 1;
	end
end

endmodule
