module tristate(
  input T, I,
  output reg 0
);

  always @(T or I)
    if (~T)
      O= I;
  else
    O = 1'bZ;

  end 
endmodule
