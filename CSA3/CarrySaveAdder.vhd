library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySaveAdder is
    generic(width: integer := 8);
    Port(
        A, B, C: in std_logic_vector(width - 1 downto 0);
        clk: in std_logic;
        Sum: out std_logic_vector(width + 1 downto 0)
    );    
end CarrySaveAdder;

architecture Behavioral of CarrySaveAdder is

component FullAdder
    Port(
        A , B, Cin : in std_logic;
        S, Cout : out std_logic
    ); 
end component;

component RippleCarryAdder
    Port(
        In1, In2: in std_logic_vector(width - 1 downto 0);
        Sum: out std_logic_vector(width downto 0)
    );
end component;

signal A_reg, B_reg, C_reg: std_logic_vector(width - 1 downto 0);
signal Cint: std_logic_vector(width - 1 downto 0);
signal Sum_int: std_logic_vector(width downto 0);
signal Sum_int_reg: std_logic_vector(width + 1 downto 0);

begin

    gFA: for i in 0 to width - 1 generate
        FAx : FullAdder port map(
            A => A_reg(i), 
            B => B_reg(i), 
            Cin => C_reg(i), 
            S => Sum_int(i), 
            Cout => Cint(i)
        );
    end generate;
    
    Sum_int(width) <= '0';

    RCA: RippleCarryAdder port map(
        In1 => Cint,
        In2 => Sum_int(width downto 1),
        Sum => Sum_int_reg(width + 1 downto 1)
    );
    
    Sum_int_reg(0) <= Sum_int(0);

    process(clk)
    begin
        if(rising_edge(clk)) then
            A_reg <= A;
            B_reg <= B;
            C_reg <= C;
            Sum <= Sum_int_reg;
        end if;
    end process;

end Behavioral;