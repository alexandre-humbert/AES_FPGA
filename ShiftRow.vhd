library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftRow is
port (  IN_ShiftRow : in std_logic_vector(127 downto 0);
		OUT_ShiftRow : out std_logic_vector(127 downto 0));

end ShiftRow;

architecture arch of ShiftRow is

begin
OUT_ShiftRow(127 downto 120) <= IN_ShiftRow(127 downto 120) ;
OUT_ShiftRow(23 downto 16) <= IN_ShiftRow(119 downto 112);
OUT_ShiftRow(47 downto 40) <= IN_ShiftRow(111 downto 104) ;
OUT_ShiftRow(71 downto 64) <= IN_ShiftRow(103 downto 96);
OUT_ShiftRow(95 downto 88) <= IN_ShiftRow(95 downto 88)   ;
OUT_ShiftRow(119 downto 112) <= IN_ShiftRow(87 downto 80)   ;
OUT_ShiftRow(15 downto 8) <= IN_ShiftRow(79 downto 72)   ;
OUT_ShiftRow(39 downto 32) <= IN_ShiftRow(71 downto 64)   ;
OUT_ShiftRow(63 downto 56) <= IN_ShiftRow(63 downto 56)   ;
OUT_ShiftRow(87 downto 80) <= IN_ShiftRow(55 downto 48)   ;
OUT_ShiftRow(111 downto 104) <= IN_ShiftRow(47 downto 40)   ;
OUT_ShiftRow(7 downto 0) <= IN_ShiftRow(39 downto 32)   ;
OUT_ShiftRow(31 downto 24) <= IN_ShiftRow(31 downto 24)   ;
OUT_ShiftRow(55 downto 48) <= IN_ShiftRow(23 downto 16)   ;
OUT_ShiftRow(79 downto 72) <= IN_ShiftRow(15 downto 8)    ;
OUT_ShiftRow(103 downto 96) <= IN_ShiftRow(7 downto 0)     ;


end arch;