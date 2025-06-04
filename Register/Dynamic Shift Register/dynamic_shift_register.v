`timescale 1ns / 1ps

module dynamic_shift_register #(
    parameter SELWIDTH = 3
)(
    input clk,
    input clken,
    input rst,
    input SI,
    input [SELWIDTH-1:0] SEL,
    output DO
);

localparam DATAWIDTH = 2**SELWIDTH;
reg [DATAWIDTH-1:0] data;

assign DO = data [SEL];

always @(posedge clk or posedge rst)
begin
	if (rst)
		data <= 0;
	else if (clken)
		data <= {data[DATAWIDTH-2:0], SI};
	//For rightward shift(MSB to LSB) i.e. each bit shifts from right to left
	//data <= {SI, data[DATAWIDTH-1:1]};
end

endmodule
