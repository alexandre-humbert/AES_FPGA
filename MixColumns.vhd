library IEEE;
use IEEE.std_logic_1164.all;

entity MixColumns is
port (  IN_MixColumns: in std_logic_vector(31 downto 0);
	OUT_MixColumns : out std_logic_vector(31 downto 0));

end MixColumns;

architecture arch of MixColumns is


signal Oxt0, Oxt1, Oxt2, Oxt3, Ixt0, Ixt1, Ixt2, Ixt3 :  std_logic_vector(7 downto 0);
begin

Oxt0 <= Ixt0(6 downto 0)&'0' when (Ixt0(7) = '0') else Ixt0(6 downto 0)&'0' xor x"1b";
Oxt1 <= Ixt1(6 downto 0)&'0' when (Ixt1(7) = '0') else Ixt1(6 downto 0)&'0' xor x"1b";
Oxt2 <= Ixt2(6 downto 0)&'0' when (Ixt2(7) = '0') else Ixt2(6 downto 0)&'0' xor x"1b";
Oxt3 <= Ixt3(6 downto 0)&'0' when (Ixt3(7) = '0') else Ixt3(6 downto 0)&'0' xor x"1b";

Ixt0 <= IN_MixColumns(31 downto 24) xor IN_MixColumns(23 downto 16);
Ixt1 <= IN_MixColumns(23 downto 16) xor IN_MixColumns(15 downto 8);
Ixt2 <= IN_MixColumns(15 downto 8) xor IN_MixColumns(7 downto 0);
Ixt3 <= IN_MixColumns(7 downto 0) xor IN_MixColumns(31 downto 24);

OUT_MixColumns(31 downto 24) <= Oxt0 xor IN_MixColumns(23 downto 16) xor IN_MixColumns(15 downto 8) xor IN_MixColumns(7 downto 0);
OUT_MixColumns(23 downto 16) <= Oxt1 xor IN_MixColumns(15 downto 8) xor IN_MixColumns(7 downto 0) xor IN_MixColumns(31 downto 24);
OUT_MixColumns(15 downto 8) <= Oxt2 xor IN_MixColumns(7 downto 0) xor IN_MixColumns(31 downto 24) xor IN_MixColumns(23 downto 16);
OUT_MixColumns(7 downto 0) <= Oxt3 xor IN_MixColumns(31 downto 24) xor IN_MixColumns(23 downto 16) xor IN_MixColumns(15 downto 8);

end arch;