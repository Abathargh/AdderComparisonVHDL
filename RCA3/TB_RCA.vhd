library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_RCA is
    generic(width: integer := 16);
end TB_RCA;

architecture Behavioral of TB_RCA is

component RCA_3IN
    Port(
        A, B, C: in std_logic_vector(width - 1 downto 0);
        clk: in std_logic;
        Sum: out std_logic_vector(width + 1 downto 0)
    );
end component;

signal A, B, C: std_logic_vector(width - 1 downto 0);
signal clk: std_logic;
signal Sum: std_logic_vector(width + 1 downto 0);

constant clk_period : time := 3 ns;

begin
    uut: RCA_3IN port map(A => A, B => B, C => C, clk => clk, Sum => Sum);
    
    process begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
    
    process begin
    end process; 
end Behavioral;
