`timescale 1ns / 1ps
module tb_mux_4x1();
	reg [1:0] sel;
	reg [3:0]i0,i1,i2,i3;
	wire[3:0]y;

mux_4x1 UUT (sel,i0,i1,i2,i3,y);

initial begin
i0=4'h5;
i1=4'h7;
i2=4'h9;
i3=4'hB;
sel=2'h0;
#5 sel=2'h1;
#5 sel=2'h2;
#5 sel=2'h3;

#5 $finish;
end

endmodule