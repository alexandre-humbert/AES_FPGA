library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity InvMixColumns_tb is
end InvMixColumns_tb;

architecture arch of InvMixColumns_tb is

signal IN_InvMixColumns : std_logic_vector(127 downto 0) := round13;
signal OUT_InvMixColumns : std_logic_vector(127 downto 0);

begin

Gen_InvMixCols: 
  for I in 0 to 3 generate
    InvMixColX : entity  work.InvMixColumns(arch) port map
    (IN_InvMixColumns	=> IN_InvMixColumns(32*I + 31 downto 32*I),
     OUT_InvMixColumns => OUT_InvMixColumns(32*I + 31 downto 32*I));
  end generate Gen_InvMixCols;


Test : process
begin
wait for 10 ns;

if OUT_InvMixColumns = round12 then
    report "Test PASS";
else
    report "Test FAIL";
end if;
wait;
end process;

end arch;