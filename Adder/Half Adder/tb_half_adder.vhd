library ieee;
use ieee.std_logic_1164.all

entity tb_half_adder is
  end tb_half_adder;

architecture rtl of tb_half_adder is
  signal rbit1: std_logic := '0';
  signal rbit2: std_logic := '0';
  signal wsum: std_logic;
  signal wcarry: std_logic;
begin
  uut: entity work.half_adder
    port map(
      in1 => rbit1,
      in2 => rbit2,
      sum => wsum,
      carry => wcarry
    );

    process is
    begin
      rbit1 <= '0';
      rbit2 <= '1';    
      wait for 10ns;

      rbit1 <= '1';
      rbit2 <= '0';
      wait for 10ns;

      rbit1 <= '1';
      rbit2 <= '1';
      wait for 10ns;

      rbit1 <= '0';
      rbit2 <= '0';
      wait;
    end process;
end rtl;


      

  
