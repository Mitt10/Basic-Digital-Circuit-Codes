`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_cla_adder();
reg [3:0] A,B;
reg Cin;
wire[3:0] Sum;
wire Cout;

cla_adder UUT (A,B,Cin,Sum,Cout);

initial begin
$monitor("%0t\t%b\t%b\t%b\t|\t%b\t%b", $time, A, B, Cin, Sum, Cout);
A=4'h6;B=4'h4;Cin=0;
#10 A=4'h5;B=4'h9;Cin=1;
#10 A=4'h3;B=4'h8;Cin=1;
#10 A = 4'b1111; B = 4'b0001; Cin = 0;
#10 $finish;
end
endmodule
