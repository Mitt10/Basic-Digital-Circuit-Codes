library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is 
port(
    in1: in std_logic := '0';
    in2: in std_logic := '0';
    Cin: in std_logic := '0';
    sum: out std_logic;
    Cout: out std_logic
);
end full_adder;

architecture rtl of full_adder is
    signal wire1: std_logic;
    signal wire2: std_logic;
    signal wire3: std_logic;
    
    begin
        wire1 <= in1 xor in2;
        wire2 <= (in1 xor in2) and Cin;
        wire3 <= in1 and in2;
        
        sum <= wire1 xor Cin;
        Cout <= wire2 or wire3;
    end rtl; 

