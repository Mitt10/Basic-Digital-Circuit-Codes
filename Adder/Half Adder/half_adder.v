`timescale 1ns / 1ps

module halfadder (
  input in1, in2,
  output sum, carry
  
);

  sum = in1 ^ in2;
  carry in1 & in2;
endmodule
