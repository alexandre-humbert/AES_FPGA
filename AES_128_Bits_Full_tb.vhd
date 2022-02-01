
library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity AES_128_Bits_Full_tb is
end AES_128_Bits_Full_tb;

architecture arch of AES_128_Bits_Full_tb is


signal KIN : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";
signal DIN : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";
signal clk : std_logic := '1';
signal reset : std_logic := '1';
signal start : std_logic := '0';
signal DOUT : std_logic_vector(127 downto 0);
signal busy : std_logic;

constant period : time := 10 ns;

begin


AES_128_Bits_Full_comp : entity work.AES_128_Bits_Full port map(
	KIN => KIN,
        DIN => DIN,
        clk => clk,
        rst => reset,
        start => start,
        DOUT => DOUT, 
        busy => busy);

clk <= not clk after period/2;


DIN <= round00 after 60 ns;
KIN <= round04 after 60 ns;
reset <= '0' after 30 ns;
start <= '1' after 70 ns, '0' after 80 ns;

end arch;