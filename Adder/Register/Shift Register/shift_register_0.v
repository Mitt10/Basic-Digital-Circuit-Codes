// 32-bit Serial In Serial Out Shift Register
// Rising edge clock
// Active high clock enable
// Concatenation-based template
// File: shift_registers_0.v
//This code shifts the bit from left to right, left being LSB and at every clock edge, if clken = 1, then MSB is shifted out and becomes output SO

module shift_register_0 (
  input clk, clken, SI,
  output SO
);
  parameter WIDTH = 32;
  reg [WIDTH-1:0] shreg;

  always @(posedge clk)
    begin
      if (clken)
        shreg = {shreg[WIDTH-2:0], SI};
    end

  assign SO = shreg[WIDTH-1];
endmodule

