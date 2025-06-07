`timescale 1ns / 1ps

module tb_rip_ca();
reg [3:0] A,B;
reg Cin;
wire [3:0] Sum, Cout;
wire [4:0] add;

ripple_carry_adder RA (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
assign add = {Cout[3], Sum};

initial begin
$monitor("A = %b: B = %b, Cin = %b --> Sum= %b, Cout[3] = %b, Addition = %0d", A, B, Cin, Sum, Cout[3], add);
    A = 1; B = 0; Cin = 0; #10;
    A = 2; B = 4; Cin = 1; #10;
    A = 4'hb; B = 4'h6; Cin = 0; #10;
    A = 5; B = 3; Cin = 1; #10;
    $finish;

end
endmodule
