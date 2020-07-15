library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity RCA_3IN is
generic (width: integer := 8);
    Port(
        A, B, C: in std_logic_vector(width - 1 downto 0);
        clk: in std_logic;
        Sum: out std_logic_vector(width + 1 downto 0)
    );
end RCA_3IN;

architecture Behavioral of RCA_3IN is

signal A_reg, B_reg, C_reg: std_logic_vector(width - 1 downto 0);
signal Sum_int_AB: std_logic_vector(width downto 0);
signal Sum_int_ABC: std_logic_vector(width + 1 downto 0);

begin
    
    process(A_reg, B_reg)
    variable tempSum : unsigned(width downto 0);
    begin
        tempSum := unsigned('0'&A_reg) + unsigned('0'&B_reg);
        Sum_int_AB <= std_logic_vector(tempSum);
    end process;
    
    process(Sum_int_AB, C_reg)
    variable tempSum : unsigned(width + 1 downto 0);
    begin
        tempSum := unsigned('0'&Sum_int_AB) + unsigned('0'&'0'&C_reg);
        Sum_int_ABC <= std_logic_vector(tempSum);
    end process;
    
    process(clk)
    begin
        if(rising_edge(clk)) then
            A_reg <= A;
            B_reg <= B;
            C_reg <= C;
            Sum <= Sum_int_ABC;
        end if;    
    end process;

end Behavioral;
