library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity InvMixColumns_tb is
end InvMixColumns_tb;

architecture arch of InvMixColumns_tb is

component InvMixColumns is
port (  IN_InvMixColumns: in std_logic_vector(31 downto 0);
	OUT_InvMixColumns : out std_logic_vector(31 downto 0));
end component InvMixColumns;


signal IN_InvMixColumns : std_logic_vector(31 downto 0) := round13(127 downto 96);
signal OUT_InvMixColumns : std_logic_vector(31 downto 0);

begin

InvMixColumns_comp : InvMixColumns port map(IN_InvMixColumns => IN_InvMixColumns, OUT_InvMixColumns => OUT_InvMixColumns);


end arch;