library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_CSA is
    generic(width: integer := 8);
end TB_CSA;

architecture Behavioral of TB_CSA is

component CarrySaveAdder is
    Port(
        A, B, C: in std_logic_vector(width - 1 downto 0);
        clk: in std_logic;
        Sum: out std_logic_vector(width + 1 downto 0)
    );    
end component;

signal A, B, C: std_logic_vector(width - 1 downto 0);
signal clk: std_logic;
signal Sum: std_logic_vector(width + 1 downto 0);

constant clk_period: time := 2 ns;

begin
    uut: CarrySaveAdder port map(
        A => A,
        B => B,
        C => C,
        clk => clk,
        Sum => Sum
    );
    
    process begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    process begin
    end process;
end Behavioral;

