`timescale 1ns / 1ps

module tb_sync_counter ();
	parameter SIZE=4;
	reg clk,rst,up;
	wire [SIZE-1:0] count;
	
	synchronous_counter#(SIZE) UUT (clk,rst,up,count);
	
	initial clk=1;
	always #2 clk=~clk;
	
	initial begin
		rst = 0; up=1;
		#4 rst=1;
		#60;
		rst=0;
		#2 rst=1; up=0;
		#60;
		$finish;
	end
	
	initial begin
		$dumpvars (0, tb_sync_counter);
		$dumpfile ("synchronous_counter.vcd");
	end
	
endmodule