`timescale 1ns / 1ps
`define USE_STRUCTURAL  // <-- Comment this line to use behavioral version

module cla_adder #(parameter WIDTH = 4) (
    input  [WIDTH-1:0] A, B,
    input              Cin,
`ifdef USE_STRUCTURAL
    output wire [WIDTH-1:0] Sum,
    output wire             Cout
`else
    output reg  [WIDTH-1:0] Sum,
    output reg              Cout
`endif
);

`ifdef USE_STRUCTURAL
  // Structural implementation using assign
  wire [WIDTH-1:0] G_wire, P_wire;
  wire [WIDTH:0]   C_wire;

  assign G_wire = A & B;       // Generate
  assign P_wire = A ^ B;       // Propagate
  assign C_wire[0] = Cin;

  genvar i;
  generate
    for (i = 0; i < WIDTH; i = i + 1) begin : CLA_ASSIGN
      assign C_wire[i+1] = G_wire[i] | (P_wire[i] & C_wire[i]);
      assign Sum[i]      = P_wire[i] ^ C_wire[i];
    end
  endgenerate

  assign Cout = C_wire[WIDTH];

`else
  // Behavioral implementation using always block
  reg [WIDTH-1:0] G, P;
  reg [WIDTH:0]   C;

  integer i;

  always @(*) begin
    G = A & B;
    P = A ^ B;

    C[0] = Cin;
    for (i = 0; i < WIDTH; i = i + 1)
      C[i+1] = G[i] | (P[i] & C[i]);

    for (i = 0; i < WIDTH; i = i + 1)
      Sum[i] = P[i] ^ C[i];

    Cout = C[WIDTH];
  end

`endif

endmodule