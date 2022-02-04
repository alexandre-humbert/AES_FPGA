library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity ShiftRow_tb is
end ShiftRow_tb;

architecture arch of ShiftRow_tb is

signal IN_ShiftRow : std_logic_vector(127 downto 0) := round11;
signal OUT_ShiftRow : std_logic_vector(127 downto 0);
begin

ShiftRow_comp : entity work.ShiftRow(arch) port map
	(IN_ShiftRow => IN_ShiftRow, OUT_ShiftRow => OUT_ShiftRow);

Test : process
begin
wait for 10 ns;

if OUT_ShiftRow = round12 then
    report "Test PASS";
else
    report "Test FAIL";
end if;
wait;
end process;

end arch;