// Parameterized Serial In Serial Out Shift Register
// Rising edge clock
// Active high clock enable
// Concatenation-based template
// File: shift_registers_0.v
//This code shifts the bit from left to right, left being LSB and at every clock edge, if clken = 1, then MSB is shifted out and becomes output SO
`timescale 1ns / 1ps

module shift_register_0 (
  input clk, rst, clken, SI,
  output SO
);

  parameter WIDTH = 4;
  reg [WIDTH-1:0] shreg;

  always @(posedge clk or posedge rst)
    begin
      if (rst) begin
        shreg <= 0;
      end
      else if (clken) begin
        shreg <= {shreg[WIDTH-2:0], SI};
      end    
    end

  assign SO = shreg[WIDTH-1];
  //For rightward shift i.e. MSB to LSB, each bit shifts from right to left
 // else if (clken) begin
   // shreg <= {SI, shreg[WIDTH-1:1]};
  //end
  //end
  //assign SO = shreg[0];
endmodule

