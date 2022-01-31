library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity AES_128_Bits_tb is
end AES_128_Bits_tb;

architecture arch of AES_128_Bits_tb is


signal KIN : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";
signal DIN : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";
signal clk : std_logic := '0';
signal reset : std_logic := '1';
signal start : std_logic := '0';
signal DOUT : std_logic_vector(127 downto 0);
signal busy : std_logic;

constant period : time := 10 ns;

begin


AES_128_Bits_comp : entity work.AES_128_Bits port map(
	KIN => KIN,
        DIN => DIN,
        clk => clk,
        rst => reset,
        start => start,
        DOUT => DOUT, 
        busy => busy);

clk <= not clk after period/2;


DIN <= round00 after 60 ns;
KIN <= round04 after 100 ns, round14 after 110 ns, round24 after 120 ns,round34 after 130 ns, round44 after 140 ns, round54 after 150 ns, round64 after 160 ns, round74 after 170 ns, round84 after 180 ns, round94 after 190 ns, round104 after 200 ns;
reset <= '0' after 50 ns;
start <= '1' after 90 ns, '0' after 100 ns;

end arch;
