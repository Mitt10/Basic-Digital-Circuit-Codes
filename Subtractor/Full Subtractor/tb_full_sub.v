`timescale 1ns / 1ps

module tb_full_sub();

reg a,b,bin;
wire diff, borrow;

full_sub UUT (.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow));

initial begin
$monitor("At time %0t: a=%b b=%b, bin=%b, difference=%b, borrow=%b",$time, a,b,bin,diff,borrow);
a=0;b=0;bin=0;

#10 a=0;b=0;bin=1;
#10 a=0;b=1;bin=0;
#10 a=0;b=1;bin=1;
#10 a=1;b=0;bin=0;
#10 a=1;b=0;bin=1;
#10 a=1;b=1;bin=0;
#10 a=1;b=1;bin=1;

#10 $finish;

end

endmodule
