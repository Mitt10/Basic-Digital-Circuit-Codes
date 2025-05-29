`timescale 1ns / 1ps


module tb_full_adder_veri();

reg in1_tb, in2_tb, Cin_tb;
wire sum_tb, Cout_tb;

full_adder uut (
    .in1(in1_tb),
    .in2(in2_tb),
    .Cin(Cin_tb),
    .sum(sum_tb),
    .Cout(Cout_tb)
);

initial begin

Cin_tb = 1'b0;
in1_tb = 1'b0;
in2_tb = 1'b0;
#10;

Cin_tb = 1'b0;
in1_tb = 1'b0;
in2_tb = 1'b1;
#10;

Cin_tb = 1'b0;
in1_tb = 1'b1;
in2_tb = 1'b0;
#10;

Cin_tb = 1'b0;
in1_tb = 1'b1;
in2_tb = 1'b1;
#10;

Cin_tb = 1'b1;
in1_tb = 1'b0;
in2_tb = 1'b0;
#10;

Cin_tb = 1'b1;
in1_tb = 1'b0;
in2_tb = 1'b1;
#10;

Cin_tb = 1'b1;
in1_tb = 1'b1;
in2_tb = 1'b0;
#10;

Cin_tb = 1'b1;
in1_tb = 1'b1;
in2_tb = 1'b1;
#20  $finish;
end


initial begin
$dumpvars (1, tb_full_adder_veri);
$dumpfile ("full adder verilog");
end
endmodule
