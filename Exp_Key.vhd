library IEEE;
use IEEE.std_logic_1164.all;

entity RCON_Gen is
port ( 
		clk : in std_logic;
		enable : in std_logic;
		rout : out std_logic_vector(31 downto 0));

end RCON_Gen;

architecture arch of RCON_Gen is
  
signal rcon : std_logic_vector(31 downto 0);
begin
process (clk)
begin
  if rising_edge(clk) then
    if enable = '0' then
      rcon <= x"01000000";
    else
      if rcon(31) = '0' then
        rcon <= rcon(30 downto 0)&'0';
      else 
        rcon <= rcon(30 downto 0)&'0' xor x"1b000000";
      end if;
    end if;
  end if;
end process;
 rout <= rcon;
end arch;


library IEEE;
use IEEE.std_logic_1164.all;

entity Exp_Key is
port (  kin : in std_logic_vector(127 downto 0);
		clk : in std_logic;
		enable : in std_logic;
		kout : out std_logic_vector(127 downto 0));

end Exp_Key;

architecture arch of Exp_Key is
  
signal IN_SubBytes : std_logic_vector(31 downto 0);
signal OUT_SubBytes : std_logic_vector(31 downto 0);
signal mux_W0, mux_W1, mux_W2, mux_W3, W0, W1, W2, W3, W4, W5, W6, W7 : std_logic_vector(31 downto 0);
signal OUT_ROT, FOUT, OUT_RCON : std_logic_vector(31 downto 0);
begin

Gen_SubByte: 
  for I in 0 to 1 generate
    SubByteX : entity  work.Double_SubByte(SYN) port map
    (address_a		=> IN_SubBytes(16*I + 7 downto 16*I),
		address_b => IN_SubBytes(16*I + 15 downto 16*I+8),
		clk		=> clk,
		SBox_invSbox => '0' ,
		q_a	=> OUT_SubBytes(16*I + 7 downto 16*I),
		q_b		=> OUT_SubBytes(16*I + 15 downto 16*I+8));
  end generate Gen_SubByte;

  
RCON_comp : entity work.RCON_Gen(arch) port map( 
		clk => clk,
		enable => enable,
		rout => OUT_RCON);


process (enable,kin,W4,W5,W6,W7)
begin
  if enable = '0' then
     mux_W0 <= kin(127 downto 96);
     mux_W1 <= kin(95 downto 64);
     mux_W2 <= kin(63 downto 32);
     mux_W3 <= kin(31 downto 0);
  else
    mux_W0 <= W4;
    mux_W1 <= W5;
    mux_W2 <= W6;
    mux_W3 <= W7;
  end if;
end process;

process (clk)
begin
if rising_edge(clk) then
    W0 <= mux_W0;
    W1 <= mux_W1;
    W2 <= mux_W2;
    W3 <= mux_W3;
  end if;
end process;

OUT_ROT <= mux_W3(23 downto 0) & mux_W3(31 downto 24);
IN_SubBytes <= OUT_ROT;
FOUT <= OUT_SubBytes xor OUT_RCON;

W4 <= W0 xor FOUT;
W5 <= W1 xor W4;
W6 <= W2 xor W5;
W7 <= W3 xor W6;
kout <= W0 & W1 & W2 & W3;
end arch;
