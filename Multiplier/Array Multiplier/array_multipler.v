module half_adder(input a, b, output s0, c0);
  assign s0 = a ^ b;
  assign c0 = a & b;
endmodule

module full_adder(
    input in1, in2, Cin,
    output Cout, sum
    );
    
assign sum= in1 ^ in2 ^ Cin;
assign Cout = ((in1 ^ in2) & Cin) | (in1 & in2); 
endmodule

module array_multiplier(input [1:0] a, b,
    output [3:0] z
    );
  reg signed p[2][2];
  wire[3:0] c;
  wire [3:0] s;
  genvar g;

  generate 
    for(g=0;g<2;g=g+1)
    begin
      and(p[g][0],a[g],b[0]);
      and(p[g][1],a[g],b[1]);
    end
  endgenerate
  assign z[0] = p[0][0];

  half_adder h0(p[1][0],p[0][1],z[1],c[0]);
  half_adder h1(p[1][1],c[0],z[2],c[1]);
  endmodule











endmodule