library ieee;
use ieee.std_logic_1164.all
use ieee.numeric_std.all

entity half_adder is
  port (
    in1: in std_logic;
    in2: in std_logic;
    sum: out std_logic;
    carry: out std_logic;    
  );

architecture rtl of half_adder is 
  begin
    sum <= in1 xor in2;
    carry <= in1 and in2;
  end rtl;
  
