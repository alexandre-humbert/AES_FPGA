library IEEE;
use IEEE.std_logic_1164.all;

entity AddRoundKey is
port (  KeyRound : in std_logic_vector(127 downto 0);
		IN_AddRoundKey : in std_logic_vector(127 downto 0);
		OUT_AddRoundKey : out std_logic_vector(127 downto 0));

end AddRoundKey;

architecture arch of AddRoundKey is

begin
OUT_AddRoundKey <= KeyRound xor IN_AddRoundKey;
end arch;