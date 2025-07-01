`timescale 1ns / 1ps

// JK Flip-Flop with synchronous reset
module JK_FF(
	input j,          // J input
	input k,          // K input
	input rst,        // Synchronous active-low reset
	input clk,        // Clock signal
	output reg q,     // Flip-flop output
	output q_bar      // Complement of output
);

// Continuous assignment to generate complement of q
assign q_bar = ~q;

// Always block triggered on rising edge of clock
// Synchronous reset version (reset is checked inside the always block)
//always @(posedge clk or negedge rst)  // for asynchronous reset
always @(posedge clk)
begin
	if (!rst)
		q <= 0;  // Reset the output to 0 if rst is low
	else
	begin
		// Case statement based on JK input combination
		case ({j, k})
			2'b00: q <= q;        // No change
			2'b01: q <= 1'b0;     // Reset
			2'b10: q <= 1'b1;     // Set
			2'b11: q <= q_bar;    // Toggle
			default: q <= q;      // Default case for safety (though all cases are covered)
		endcase
	end
end

endmodule