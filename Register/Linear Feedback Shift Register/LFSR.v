module LFSR #(WIDTH=4)(
	input clk,rst,
	output reg [WIDTH-1:0] op
);

always @(posedge clk)
begin
	if (rst)
		op <= {WIDTH{1'b1}};  // or any non-zero seed
	else
		op <= {op [WIDTH-2:0], (op[WIDTH-1]^op[WIDTH-2])};
end

endmodule