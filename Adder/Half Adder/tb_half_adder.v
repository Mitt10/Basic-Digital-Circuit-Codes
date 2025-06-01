`timescale 1ns / 1ps
module tb_half_adder();
  reg in1_tb = 0;
  reg in2_tb = 0;
  wire sum_tb, carry_tb;

  half_adder UUT (.in1(in1_tb), .in2(in2_tb), .sum(sum_tb), .carry(carry_tb));

  initial begin
    #10;
    in1_tb = 0;
    in2_tb = 1;

    
    #10;
    in1_tb = 1;
    in2_tb = 0;

    
    #10;
    in1_tb = 1;
    in2_tb = 1;

    
    #10;
    in1_tb = 0;
    in2_tb = 0;
    #10 $finish;

  end 
endmodule
