library IEEE;
use IEEE.std_logic_1164.all;
use work.const_tb.all;

entity Double_SubByte_tb is
end Double_SubByte_tb;

architecture arch of Double_SubByte_tb is

component Double_SubByte
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clk		: IN STD_LOGIC ;
		SBox_invSbox : IN STD_LOGIC ;
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

signal ADD_A : std_logic_vector(7 downto 0);
signal ADD_B : std_logic_vector(7 downto 0);
signal SBoxinv : std_logic := '0';
signal clk : std_logic := '0';
signal OUT_A : std_logic_vector(7 downto 0);
signal OUT_B : std_logic_vector(7 downto 0);

constant clk_period : time := 10 ns;



begin

Double_SubByte_comp : Double_SubByte port map(address_a => ADD_A, address_b => ADD_B, clk => clk, SBox_invSbox => SBoxinv, q_a => OUT_A, q_b => OUT_B);

p0 : process 
  begin
ADD_A <= x"02";
ADD_B <= x"12";
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
clk <= '0';

ADD_A <= x"25";
ADD_B <= x"4A";
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
clk <= '0';

ADD_A <= x"8B";
ADD_B <= x"43";
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
clk <= '0';

SBoxinv <= '1';

ADD_A <= x"02";
ADD_B <= x"12";
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
clk <= '0';

ADD_A <= x"25";
ADD_B <= x"4A";
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
clk <= '0';

ADD_A <= x"8B";
ADD_B <= x"43";
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
clk <= '0';


end process p0;
end arch;