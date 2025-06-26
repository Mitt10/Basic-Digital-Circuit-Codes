`timescale 1ns / 1ps

module tb_array_multiplier();

  // Override parameter N here
  parameter N = 10;

  // Signals
  reg  [N-1:0] a, b;
  wire [2*N-1:0] z;

  // DUT instantiation with parameter override
  par_array_mult #(.N(N)) uut (
    .a(a),
    .b(b),
    .z(z)
  );

  initial begin
    $monitor("Time=%0t | a = %0d, b = %0d --> z = %0d (bin: %b)", $time, a, b, z, z);

    a = 10'd5;     b = 10'd3;     #10;
    a = 10'd25;    b = 10'd12;    #10;
    a = 10'd255;   b = 10'd255;   #10;
    a = 10'd1023;  b = 10'd1;     #10;
    a = 10'd0;     b = 10'd511;   #10;

    #10 $finish;
  end


endmodule