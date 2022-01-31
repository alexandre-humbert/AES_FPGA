library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity InvShiftRow_tb is
end InvShiftRow_tb;

architecture arch of InvShiftRow_tb is
component InvShiftRow
port (  IN_InvShiftRow : in std_logic_vector(127 downto 0);
		OUT_invShiftRow : out std_logic_vector(127 downto 0));
end component;


signal IN_InvShiftRow : std_logic_vector(127 downto 0) := round12;
signal OUT_InvShiftRow : std_logic_vector(127 downto 0);
signal Expected : std_logic_vector(127 downto 0) := round11;
begin

InvShiftRow_comp : InvShiftRow port map(IN_InvShiftRow => IN_InvShiftRow, OUT_InvShiftRow => OUT_InvShiftRow);


end arch;
