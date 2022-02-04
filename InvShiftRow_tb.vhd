library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity InvShiftRow_tb is
end InvShiftRow_tb;

architecture arch of InvShiftRow_tb is


signal IN_InvShiftRow : std_logic_vector(127 downto 0) := round12;
signal OUT_InvShiftRow : std_logic_vector(127 downto 0);

begin

InvShiftRow_comp : entity work.InvShiftRow(arch) port map
	(IN_InvShiftRow => IN_InvShiftRow, OUT_InvShiftRow => OUT_InvShiftRow);

Test : process
begin
wait for 10 ns;

if OUT_InvShiftRow = round11 then
    report "Test PASS";
else
    report "Test FAIL";
end if;
wait;
end process;
end arch;
