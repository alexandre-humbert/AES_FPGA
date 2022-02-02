library IEEE;
use IEEE.std_logic_1164.all;

entity InvMixColumns is
port (  IN_InvMixColumns: in std_logic_vector(31 downto 0);
	OUT_InvMixColumns : out std_logic_vector(31 downto 0));

end InvMixColumns;

architecture arch of InvMixColumns is


signal Oxt20, Oxt21, Oxt22, Oxt23, Oxt40, Oxt41, Oxt42, Oxt43, Oxt40tmp, Oxt41tmp, Oxt42tmp, Oxt43tmp, Oxt8, Oxt8tmp, Oxt8tmp1, Ixt20, Ixt21, Ixt22, Ixt23, Ixt40, Ixt41, Ixt42, Ixt43, Ixt8, S0, S1, S2, S3 :  std_logic_vector(7 downto 0);
begin

S0 <= IN_InvMixColumns(31 downto 24);
S1 <= IN_InvMixColumns(23 downto 16);
S2 <= IN_InvMixColumns(15 downto 8);
S3 <= IN_InvMixColumns(7 downto 0);


Ixt20 <= S0 xor S1;
Ixt21 <= S1 xor S2;
Ixt22 <= S2 xor S3;
Ixt23 <= S0 xor S3;
Ixt40 <= S0 xor S2;
Ixt41 <= S1 xor S3;
Ixt42 <= S0 xor S2;
Ixt43 <= S1 xor S3;
Ixt8 <= S0 xor S1 xor S2 xor S3;

Oxt20 <= Ixt20(6 downto 0)&'0' when (Ixt20(7) = '0') else Ixt20(6 downto 0)&'0' xor x"1b";
Oxt21 <= Ixt21(6 downto 0)&'0' when (Ixt21(7) = '0') else Ixt21(6 downto 0)&'0' xor x"1b";
Oxt22 <= Ixt22(6 downto 0)&'0' when (Ixt22(7) = '0') else Ixt22(6 downto 0)&'0' xor x"1b";
Oxt23 <= Ixt23(6 downto 0)&'0' when (Ixt23(7) = '0') else Ixt23(6 downto 0)&'0' xor x"1b";

Oxt40tmp <= Ixt40(6 downto 0)&'0' when (Ixt40(7) = '0') else Ixt40(6 downto 0)&'0' xor x"1b";
Oxt41tmp <= Ixt41(6 downto 0)&'0' when (Ixt41(7) = '0') else Ixt41(6 downto 0)&'0' xor x"1b";
Oxt42tmp <= Ixt42(6 downto 0)&'0' when (Ixt42(7) = '0') else Ixt42(6 downto 0)&'0' xor x"1b";
Oxt43tmp <= Ixt43(6 downto 0)&'0' when (Ixt43(7) = '0') else Ixt43(6 downto 0)&'0' xor x"1b";

Oxt40 <= Oxt40tmp(6 downto 0)&'0' when (Oxt40tmp(7) = '0') else Oxt40tmp(6 downto 0)&'0' xor x"1b";
Oxt41 <= Oxt41tmp(6 downto 0)&'0' when (Oxt41tmp(7) = '0') else Oxt41tmp(6 downto 0)&'0' xor x"1b";
Oxt42 <= Oxt42tmp(6 downto 0)&'0' when (Oxt42tmp(7) = '0') else Oxt42tmp(6 downto 0)&'0' xor x"1b";
Oxt43 <= Oxt43tmp(6 downto 0)&'0' when (Oxt43tmp(7) = '0') else Oxt43tmp(6 downto 0)&'0' xor x"1b";

Oxt8tmp <= Ixt8(6 downto 0)&'0' when (Ixt8(7) = '0') else Ixt8(6 downto 0)&'0' xor x"1b";
Oxt8tmp1 <= Oxt8tmp(6 downto 0)&'0' when (Oxt8tmp(7) = '0') else Oxt8tmp(6 downto 0)&'0' xor x"1b";
Oxt8 <= Oxt8tmp1(6 downto 0)&'0' when (Oxt8tmp1(7) = '0') else Oxt8tmp1(6 downto 0)&'0' xor x"1b";

OUT_InvMixColumns(31 downto 24) <= Oxt8 xor Oxt40 xor Oxt20 xor S1 xor S2 xor S3;
OUT_InvMixColumns(23 downto 16) <= Oxt8 xor Oxt41 xor Oxt21 xor S0 xor S2 xor S3;
OUT_InvMixColumns(15 downto 8) <= Oxt8 xor Oxt42 xor Oxt22 xor S0 xor S1 xor S3;
OUT_InvMixColumns(7 downto 0) <= Oxt8 xor Oxt43 xor Oxt23 xor S0 xor S1 xor S2;

end arch;
