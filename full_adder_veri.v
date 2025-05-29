`timescale 1ns / 1ps

module full_adder_veri(
    input in1, in2, Cin,
    output Cout, sum
    );
    
assign sum= in1 ^ in2 ^ Cin;
assign Cout = ((in1 ^ in2) & Cin) | (in1 & in2); 
endmodule
