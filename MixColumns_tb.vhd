library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity MixColumns_tb is
end MixColumns_tb;

architecture arch of MixColumns_tb is

component MixColumns is
port (  IN_MixColumns: in std_logic_vector(31 downto 0);
	OUT_MixColumns : out std_logic_vector(31 downto 0));
end component MixColumns;


signal IN_MixColumns : std_logic_vector(31 downto 0) := round13(127 downto 96);
signal OUT_MixColumns : std_logic_vector(31 downto 0);

begin

MixColumns_comp : MixColumns port map(IN_MixColumns => IN_MixColumns, OUT_MixColumns => OUT_MixColumns);


end arch;