`timescale 1ns / 1ps

module tb_mux_2x1();
    reg sel,i0,i1;
    wire y;
    
mux_2x1 UUT(.i0(i0), .i1(i1), .sel(sel), .y(y));
	
	initial begin
		$monitor("Sel=%h, i0=%h, i1=%h, --->  y=%h", sel,i0,i1,y);
		
		sel=1;
		i0=0; i1=1;
		#5 i0=1;i1=0;
		#5 sel=0;
		i0=0; i1=1;
		#5 i0=1;i1=0;
		 
		#10 $finish;
	end
endmodule
