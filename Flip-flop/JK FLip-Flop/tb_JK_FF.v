`timescale 1ns / 1ps
module tb_JK_FF();
	reg j,k,rst,clk;
	wire q,q_bar;
	
	JK_FF UUT (j,k,rst,clk,q,q_bar);
	
	initial clk=1;
	always #5 clk=~clk;
	
	task drive;
	input [1:0] bit;
	begin
		@(posedge clk)
		{j,k} = bit;
		#1 $display ("J=%b, K=%b --> Q=%b, Qbar = %b",j,k,q,q_bar);
	end
	endtask;
	
	initial begin
		rst=0;
		j=0;k=0;
		
		#5 rst=1;
		drive(2'b01);
		drive(2'b10);
		drive(2'b11);
		drive(2'b00);
		drive(2'b10);
		drive(2'b11);
		#10 $finish;
	end
	
	initial begin
		$dumpvars(0);
		$dumpfile ("JK FF.vcd");
	end
endmodule