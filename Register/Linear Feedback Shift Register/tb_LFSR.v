`timescale 1ns / 1ps

module tb_LFSR();
	parameter WIDTH=4;

	reg clk,rst;
	wire [WIDTH-1:0] op;

	LFSR #(.WIDTH(WIDTH)) UUT (.clk(clk), .rst(rst), .op(op));
	
	initial clk=1;
	always #5 clk=~clk;
	
	initial begin
	rst=1;
	#5 rst=0;
	#80 $finish;
	end
    
    initial begin
    $dumpvars(0, tb_LFSR);
    $dumpfile ("LFSR.vcd");
    end
    
endmodule
