`timescale 1ns / 1ps

// ------------------------------------------------------------------
// Module: Encoder_8x3
// Function: Encodes an 8-bit one-hot input into a 3-bit binary output
// Assumption: Only one bit of the input 'dec' is high at a time
// Notes   : Uses `ifndef STRUCTURAL` to toggle between behavioral 
//           and structural implementations.
// ------------------------------------------------------------------
module Encoder_8x3(
    input  [7:0] dec,       // 8-bit one-hot input
    output [2:0] bin        // 3-bit binary output
);

`ifndef STRUCTURAL
  // ---------------------------
  // Behavioral implementation
  // ---------------------------
  reg [2:0] bin_reg;
  assign bin = bin_reg;

  always @(*) begin
    case (dec)
      8'b00000001 : bin_reg = 3'b000;  // Input bit 0 is high
      8'b00000010 : bin_reg = 3'b001;  // Input bit 1 is high
      8'b00000100 : bin_reg = 3'b010;  // Input bit 2 is high
      8'b00001000 : bin_reg = 3'b011;  // Input bit 3 is high
      8'b00010000 : bin_reg = 3'b100;  // Input bit 4 is high
      8'b00100000 : bin_reg = 3'b101;  // Input bit 5 is high
      8'b01000000 : bin_reg = 3'b110;  // Input bit 6 is high
      8'b10000000 : bin_reg = 3'b111;  // Input bit 7 is high
      default     : bin_reg = 3'b000;  // Default fallback
    endcase
  end

`else
  // ---------------------------
  // Structural implementation
  // ---------------------------
  assign bin[2] = dec[4] | dec[5] | dec[6] | dec[7]; // MSB
  assign bin[1] = dec[2] | dec[3] | dec[6] | dec[7]; // Middle bit
  assign bin[0] = dec[1] | dec[3] | dec[5] | dec[7]; // LSB

`endif

endmodule