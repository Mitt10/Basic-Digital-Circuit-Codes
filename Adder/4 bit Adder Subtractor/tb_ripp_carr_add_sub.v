`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_rip_car_add_sub();
	reg [3:0] A,B;
	reg CTRL;
	wire [3:0] Sum, Cout;
	
	ripple_carry_add_sub UUT (.A(A), .B(B), .CTRL (CTRL), .Sum(Sum), .Cout(Cout));
	
	initial begin
	$monitor ("A= %d, B= %d, CTRL= %d, --> Sum= %d, Cout= %d ", A,B,CTRL,Sum,Cout);
	A=0;B=0;CTRL=0;
	#10 A=1; B=2; 
	#10 A=4; B=8;
	#10 CTRL=1;A=6; B=7; 
	#10 A=12; B=5; 
	#20 $finish;
	end
	
	initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end

endmodule

