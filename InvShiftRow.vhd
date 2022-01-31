library IEEE;
use IEEE.std_logic_1164.all;

entity InvShiftRow is
port (  IN_InvShiftRow : in std_logic_vector(127 downto 0);
		OUT_InvShiftRow : out std_logic_vector(127 downto 0));

end InvShiftRow;

architecture arch of InvShiftRow is

begin
OUT_InvShiftRow(127 downto 120) <= IN_InvShiftRow(127 downto 120)  ;
OUT_InvShiftRow(119 downto 112) <= IN_InvShiftRow(23 downto 16) ;
OUT_InvShiftRow(111 downto 104) <= IN_InvShiftRow(47 downto 40) ;
OUT_InvShiftRow(103 downto 96) <= IN_InvShiftRow(71 downto 64) ;
OUT_InvShiftRow(95 downto 88) <= IN_InvShiftRow(95 downto 88)    ;
OUT_InvShiftRow(87 downto 80) <= IN_InvShiftRow(119 downto 112)  ;
OUT_InvShiftRow(79 downto 72) <= IN_InvShiftRow(15 downto 8) ;
OUT_InvShiftRow(71 downto 64) <= IN_InvShiftRow(39 downto 32) ;
OUT_InvShiftRow(63 downto 56) <= IN_InvShiftRow(63 downto 56)    ;
OUT_InvShiftRow(55 downto 48) <= IN_InvShiftRow(87 downto 80)    ;
OUT_InvShiftRow(47 downto 40) <= IN_InvShiftRow(111 downto 104)   ;
OUT_InvShiftRow(39 downto 32) <= IN_InvShiftRow(7 downto 0)    ;
OUT_InvShiftRow(31 downto 24) <= IN_InvShiftRow(31 downto 24)  ;
OUT_InvShiftRow(23 downto 16) <= IN_InvShiftRow(55 downto 48) ;
OUT_InvShiftRow(15 downto 8) <= IN_InvShiftRow(79 downto 72) ;
OUT_InvShiftRow(7 downto 0) <= IN_InvShiftRow(103 downto 96)  ;


end arch;
