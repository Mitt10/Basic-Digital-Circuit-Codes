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
    //For leftward shift (LSB -> MSB) => each bit shifts from left to right
    for (i = 0; i < WIDTH-1; i = i + 1) 
        shreg[i+1] <= shreg[i];  // LSB gets copied up
    shreg[0] <= SI;              // SI enters at bit 0 (LSB)
  end
  end 
  assign SO = shreg[WIDTH-1];
  //For rightward shift (MSB -> LSB)=> each bit shifts from right to left
  //for (i = WIDTH-1 ; i>0; i = i-1)
      //shreg[i-1] <= shreg[i];
  //shreg[WIDTH-1] <= SI;
  //assign SO = shreg[0];
  
endmodule
