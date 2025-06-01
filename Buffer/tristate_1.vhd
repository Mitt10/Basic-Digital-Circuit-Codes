library ieee;
use ieee.std_logic1164.all;
entity tristate_1 is
  port (
    T: in std_logic;
    I: in std_logic;
    O: out std_logic
  );
end tristate_1

architecture rtl of tristate_1 is
  begin
    process (T,I)
      begin
        if (T = '0') then
          O <=I;
        else
          O <= 'Z';
        end if;
    end process;
  end rtl;    
