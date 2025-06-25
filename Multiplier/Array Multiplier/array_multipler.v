`timescale 1ns/1ps

//module full_adder1(
//    input in1, in2, Cin,
//    output Cout, sum
//    );
    
//assign sum= in1 ^ in2 ^ Cin;
//assign Cout = ((in1 ^ in2) & Cin) | (in1 & in2); 
//endmodule

//module half_adder1(input a, b, output s0, c0);
//  assign s0 = a ^ b;
//  assign c0 = a & b;
//endmodule

//module array_multiplier(
//    input [2:0] a, b,
//    output [5:0] z
//);
//  wire p00,p01,p10,p11,p02,p21,p12,p20,p22;
//  wire c0, c1;

//  // Partial products
//  assign p00 = a[0] & b[0];
//  assign p01 = a[0] & b[1];
//  assign p10 = a[1] & b[0];
//  assign p11 = a[1] & b[1];
//  assign p02 = a[0] & b[2];
//  assign p12 = a[1] & b[2];
//  assign p21 = a[2] & b[1];
//  assign p20 = a[2] & b[0];
//  assign p22 = a[2] & b[2]; 

//  assign z[0] = p00;

//  // Using half adders
//  half_adder1 h0(p10, p01, z[1], c0);
//  half_adder1 h1(p11, c0, z[2], c1);

//  assign z[3] = c1;

//endmodule

module array_multiplier(
    input [3:0] a, b,
    output [7:0] z
);

wire [7:0] m0, m1, m2, m3;
wire [7:0] s1, s2, s3;

// Partial products with proper alignment (shifts)
assign m0 = (a & {4{b[0]}});           // no shift
assign m1 = (a & {4{b[1]}}) << 1;      // shift by 1
assign m2 = (a & {4{b[2]}}) << 2;      // shift by 2
assign m3 = (a & {4{b[3]}}) << 3;      // shift by 3

assign s1 = m0 + m1;
assign s2 = s1 + m2;
assign s3 = s2 + m3;

assign z = s3;

endmodule