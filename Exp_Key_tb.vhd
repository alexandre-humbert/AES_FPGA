library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity Exp_Key_tb is
end Exp_Key_tb;

architecture arch of Exp_Key_tb is
signal clk : std_logic := '0';
signal enable : std_logic := '0';
constant period : time := 10 ns;

signal kin : std_logic_vector(127 downto 0) := round04;
signal kout : std_logic_vector(127 downto 0) ;

begin

clk <= not clk after period/2;
enable <= '1' after 10 ns;

Exp_Key_comp : entity work.Exp_Key(arch) port map( 
   kin => kin,
		clk => clk,
		enable => enable,
		kout => kout
		);


end arch;