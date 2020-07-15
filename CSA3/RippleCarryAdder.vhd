library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryAdder is
    generic(width: integer := 8);
    Port(
        In1, In2: in std_logic_vector(width - 1 downto 0);
        Sum: out std_logic_vector(width downto 0)
    );
end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is

component FullAdder
    Port(
        A , B, Cin : in std_logic;
        S, Cout : out std_logic
    );
end component;

signal Cint: std_logic_vector(width downto 0);

begin
    Cint(0) <= '0';
    
    gFA: for i in 0 to width - 1 generate
        FAx : FullAdder port map(
            A => In1(i), 
            B => In2(i), 
            Cin => Cint(i), 
            S => Sum(i), 
            Cout => Cint(i+1)
        );
    end generate;
    
    Sum(width) <= Cint(width);

end Behavioral;
