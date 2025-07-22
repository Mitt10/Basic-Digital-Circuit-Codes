`timescale 1ns / 1ps

module tb_moore_1010_NonOverlap();

reg clk,rst,x;
	wire z;
	
	moore_1010_NonOverlap UUT (clk,rst,x,z);
	
	initial clk = 0;
	always #2 clk= ~clk;
	
	initial begin
    x = 0;rst = 0;
    #2 rst = 1;
    
    #3 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #10;
    $finish;
	end
	
	initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
