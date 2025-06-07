`timescale 1ns / 1ps

module tb_half_sub ();

reg a,b;
wire diff, borrow;

half_sub UUT (.a(a), .b(b), .diff(diff), .borrow(borrow));

initial begin
a=0;
b=0;

#10 a=0;b=1;
#10 a=1;b=0;
#10 a=1;b=1;
#10 a=1;b=0;
#10 a=0;b=1;
#10 a=0;b=0;
#10 $finish;
end


endmodule