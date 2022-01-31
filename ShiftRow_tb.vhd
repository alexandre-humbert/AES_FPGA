library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity ShiftRow_tb is
end ShiftRow_tb;

architecture arch of ShiftRow_tb is
component ShiftRow
port (  IN_ShiftRow : in std_logic_vector(127 downto 0);
		OUT_ShiftRow : out std_logic_vector(127 downto 0));
end component;


signal IN_ShiftRow : std_logic_vector(127 downto 0) := SubBytes1;
signal OUT_ShiftRow : std_logic_vector(127 downto 0);
begin

ShiftRow_comp : ShiftRow port map(IN_ShiftRow => IN_ShiftRow, OUT_ShiftRow => OUT_ShiftRow);


end arch;