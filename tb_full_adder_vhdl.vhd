library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
end tb_full_adder;

architecture rtl of tb_full_adder is
    signal in1_tb: std_logic := '0';
    signal in2_tb: std_logic := '0';
    signal Cin_tb: std_logic := '0';
    signal sum_tb: std_logic;
    signal Cout_tb: std_logic;
    
   begin
    uut: entity work.full_adder
    port map(
        in1 => in1_tb,
        in2 => in2_tb,
        Cin => Cin_tb,
        sum => sum_tb,
        Cout => Cout_tb 
    );
    
    process is
    begin
        wait for 10ns;
        Cin_tb <= '0';
        in1_tb <= '0';
        in2_tb <= '1';
        
        wait for 10ns;
        Cin_tb <= '0';
        in1_tb <= '1';
        in2_tb <= '0';
        
        wait for 10ns;
        Cin_tb <= '0';
        in1_tb <= '1';
        in2_tb <= '1';
        
        wait for 10ns;
        Cin_tb <= '1';
        in1_tb <= '0';
        in2_tb <= '0';
        
        wait for 10ns;
        Cin_tb <= '1';
        in1_tb <= '0';
        in2_tb <= '1';
        
        wait for 10ns;
        Cin_tb <= '1';
        in1_tb <= '1';
        in2_tb <= '0';
        
        wait for 10ns;
        Cin_tb <= '1';
        in1_tb <= '1';
        in2_tb <= '1';
        
        wait for 20ns;
        end process;
        end rtl;