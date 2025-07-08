`timescale 1ns / 1ps

module JKFF (
	input J,K,clk,rst,
	output reg q,
	output q_bar
);

always@(posedge clk or negedge rst)
begin
	if (!rst)
		q<=0;
	else
	begin
		case({J,K})
			2'b00: q<=q;
			2'b01: q<=0;
			2'b10: q<=0;
			2'b11: q<=q_bar;
			default: q<=q;
		endcase
	end
end

assign q_bar = ~q;

endmodule

module updown_selecter(
	input q,q_bar,
	input up,
	output nclk
);

assign nclk = up?q_bar:q;
endmodule

module asynchronous_counter #(parameter SIZE=4)(
  input clk, rst,
  input j, k,
  input up,
  output [SIZE-1:0] q, q_bar
);
  wire [SIZE-1:0] nclk;
  genvar g;
  
  //using generate block
  JKFF F0(j,k,clk,rst,q[0],q_bar[0]);
	generate
	for (g=1;g<SIZE;g=g+1) 
		begin:gen_loop
			updown_selecter UP0 (q[g-1],q_bar[g-1], up, nclk[g-1]);
			JKFF F1 (j,k,nclk[g-1],rst,q[g], q_bar[g]);
		end
	endgenerate
endmodule
