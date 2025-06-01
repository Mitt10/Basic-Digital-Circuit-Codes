module tristate2(
  input I,T,
  output O
);
  assign O = (~T) ? I: 1'bZ;

endmodule

  
