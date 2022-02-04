library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity Double_SubByte_tb is
end Double_SubByte_tb;

architecture arch of Double_SubByte_tb is

signal IN_SubBytes : std_logic_vector(127 downto 0) := round10;
signal OUT_SubBytes : std_logic_vector(127 downto 0);

signal SBoxinv : std_logic := '0';
signal clk : std_logic := '0';

constant period : time := 10 ns;



begin

clk <= not clk after period/2;


Gen_SubByte: 
  for I in 0 to 7 generate
    SubByteX : entity  work.Double_SubByte(SYN) port map
    (	address_a => IN_SubBytes(16*I + 7 downto 16*I),
	address_b => IN_SubBytes(16*I + 15 downto 16*I+8),
	clk => clk,
	SBox_invSbox => SBoxinv,
	q_a => OUT_SubBytes(16*I + 7 downto 16*I),
	q_b => OUT_SubBytes(16*I + 15 downto 16*I+8));
  end generate Gen_SubByte;

IN_SubBytes <= round11 after 20 ns;
SBoxinv <= '1' after 20 ns;


Test : process
begin
wait for 10 ns;

if OUT_SubBytes = round11 then
    report "Test PASS";
else
    report "Test FAIL";
end if;

wait for 20 ns;

if OUT_SubBytes = round10 then
    report "Test Inv PASS";
else
    report "Test Inv FAIL";
end if;
wait;
end process;

end arch;