`timescale 1ns / 1ps
`define STRUCTURAL  // Comment this line to test behavioral version

module tb_Encoder_8x3();

  reg [7:0] dec_tb;
  wire [2:0] bin_tb;

  // Instantiate the DUT (Design Under Test)
  Encoder_8x3 UUT (
    .dec(dec_tb),
    .bin(bin_tb)
  );

  integer i;

  initial begin
    $display("Starting testbench for Encoder_8x3");
    $display("Mode: %s", `ifdef STRUCTURAL "STRUCTURAL" `else "BEHAVIORAL" `endif);
    $monitor("Time = %0t | dec_tb = %b --> bin_tb = %b", $time, dec_tb, bin_tb);

    dec_tb = 8'h01;  // Start with bit 0 high

    for (i = 1; i < 8; i = i + 1) begin
      #5 dec_tb = 8'h01 << i;  // Shift to next one-hot input every 5 ns
    end

    #5 $finish();  // End simulation
  end

endmodule