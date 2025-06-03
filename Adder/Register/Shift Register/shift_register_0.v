// 32-bit Serial In Serial Out Shift Register
// Rising edge clock
// Active high clock enable
// Concatenation-based template
// File: shift_registers_0.v
//This code shifts the bit from left to right, left being LSB and at every clock edge, if clken = 1, then MSB is shifted out and becomes output SO
`timescale 1ns / 1ps
module shift_register_0 (
  parameter WIDTH = 32;)
  (
  input clk, rst, clken, SI,
  output SO
);
  reg [WIDTH-1:0] shreg;

  always @(posedge clk)
    begin
      if (rst) begin
        shreg <= 0;
      end
      else if (clken) begin
        shreg <= {shreg[WIDTH-2:0], SI};
      end    
    end

  assign SO = shreg[WIDTH-1];
endmodule

