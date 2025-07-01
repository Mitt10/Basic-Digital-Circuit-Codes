`timescale 1ns / 1ps

module SR_FF(
	input clk,rst,
	input S,R,
	output reg Q,
	output Q_bar
);

always @(posedge clk or negedge rst) //for asynchronous reset
//always @(posedge clk)
begin
	if (!rst)
		Q<=0;
	else begin
		case({S,R})
			2'b00: Q <= Q;       // No change
			2'b01: Q <= 1'b0;     // Reset
			2'b10: Q <= 1'b1;     // Set
			default: Q <= Q;     // Safe default - treat as no change
		endcase
	end
end

assign Q_bar = ~Q;
endmodule
