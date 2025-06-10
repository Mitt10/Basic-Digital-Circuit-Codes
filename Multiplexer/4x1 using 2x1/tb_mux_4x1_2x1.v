`timescale 1ns / 1ps

module tb_Mux_4x1_2x1();
reg i0,i1,i2,i3;
reg sel1,sel0;
wire y;

muxx_4x1 UUT(i0,i1,i2,i3,sel1,sel0,y);

initial begin
$monitor ("sel1=%b, sel0=%b --> i0=%b, i1=%b, i2=%b, i3=%b --> y=%b ", sel1,sel0,i0,i1,i2,i3,y);

i0=0;i1=1;i2=0;i3=1;
sel0=0;sel1=0;
#10 sel0=0;sel1=1;
#10 sel0=1;sel1=0;
#10 sel0=1;sel1=1;
#10 $finish;

end

endmodule
