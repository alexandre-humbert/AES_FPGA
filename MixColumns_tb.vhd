library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity MixColumns_tb is
end MixColumns_tb;

architecture arch of MixColumns_tb is

signal IN_MixColumns : std_logic_vector(127 downto 0) := round12;
signal OUT_MixColumns : std_logic_vector(127 downto 0);

begin

Gen_MixCols: 
  for I in 0 to 3 generate
    MixColX : entity  work.MixColumns(arch) port map
    (IN_MixColumns => IN_MixColumns(32*I + 31 downto 32*I),
     OUT_MixColumns => OUT_MixColumns(32*I + 31 downto 32*I));
  end generate Gen_MixCols;

Test : process
begin
wait for 10 ns;

if OUT_MixColumns = round13 then
    report "Test PASS";
else
    report "Test FAIL";
end if;
wait;
end process;

end arch;