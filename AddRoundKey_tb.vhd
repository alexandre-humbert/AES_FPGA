library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity AddRoundKey_tb is
end AddRoundKey_tb;

architecture arch of AddRoundKey_tb is
component AddRoundKey
port (  KeyRound : in std_logic_vector(127 downto 0);
		IN_AddRoundKey : in std_logic_vector(127 downto 0);
		OUT_AddRoundKey : out std_logic_vector(127 downto 0));
end component;


signal D_IN : std_logic_vector(127 downto 0) := INPUT;
signal K_IN : std_logic_vector(127 downto 0) := CKEY;
signal OUTPUT : std_logic_vector(127 downto 0);

begin

AddRoundkey_comp : AddRoundKey port map(KeyRound => K_IN, IN_AddRoundKey => D_IN, OUT_AddRoundKey => OUTPUT);

process
begin
wait for 10 ns;


if OUTPUT = StartRound1 then
    report "Test PASS";
else
    report "Test FAIL";
end if;
wait;
end process;

end arch;