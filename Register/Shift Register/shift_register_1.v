// Parameterized Shift Register
// Rising edge clock
// Active high clock enable
// For-loop based template
// File: shift_registers_1.v
`timescale 1ns / 1ps

module shift_register_1 (
  input clk, clken, rst, SI,
  output SO
);
  parameter WIDTH = 4;
  reg [WIDTH-1:0] shreg;

  integer i;
  always @(posedge clk or posedge rst)
  begin
    if (rst) begin
      shreg <= 0;
    end
  else if (clken) begin
    for (i =0 ; i< WIDTH-1; i = i+1)
      shreg[i+1] <= shreg[i];
  
  shreg[0] <= SI;
  end
  end   

  assign SO = shreg[WIDTH-1];
endmodule
