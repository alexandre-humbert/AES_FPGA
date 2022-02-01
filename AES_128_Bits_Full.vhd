library IEEE;
use IEEE.std_logic_1164.all;


entity AES_128_Bits_Full is
port (  KIN : in std_logic_vector(127 downto 0);
        DIN : in std_logic_vector(127 downto 0);
        clk : in std_logic;
        rst : in std_logic;
        start : in std_logic;
        
        DOUT : out std_logic_vector(127 downto 0); 
        busy : out std_logic
);
end AES_128_Bits_Full;


architecture arch of AES_128_Bits_Full is
signal IN_SubBytes : std_logic_vector(127 downto 0);
signal OUT_SubBytes : std_logic_vector(127 downto 0);
signal IN_AddRoundKey : std_logic_vector(127 downto 0);
signal OUT_AddRoundKey : std_logic_vector(127 downto 0);
signal IN_ShiftRow : std_logic_vector(127 downto 0);
signal OUT_ShiftRow : std_logic_vector(127 downto 0);
signal IN_MixColumns : std_logic_vector(127 downto 0);
signal OUT_MixColumns : std_logic_vector(127 downto 0);

signal OUTPUT : std_logic_vector(127 downto 0);
signal Key : std_logic_vector(127 downto 0);
signal kout : std_logic_vector(127 downto 0);

signal SelMux1 : std_logic_vector(1 downto 0);
signal SelDemux1 : std_logic;
signal enable : std_logic;

begin


AddRoundKey : entity  work.AddRoundKey(arch) port map
  (
    KeyRound => kout,
		IN_AddRoundKey =>IN_AddRoundKey,
		OUT_AddRoundKey => OUT_AddRoundKey
  );


Gen_SubByte: 
  for I in 0 to 7 generate
    SubByteX : entity  work.Double_SubByte(SYN) port map
    (address_a		=> IN_SubBytes(16*I + 7 downto 16*I),
		address_b => IN_SubBytes(16*I + 15 downto 16*I+8),
		clk		=> clk,
		SBox_invSbox => '0' ,
		q_a	=> OUT_SubBytes(16*I + 7 downto 16*I),
		q_b		=> OUT_SubBytes(16*I + 15 downto 16*I+8));
  end generate Gen_SubByte;
  
ShiftRow : entity  work.ShiftRow(arch)port map
(  IN_ShiftRow => IN_ShiftRow, 
	OUT_ShiftRow => OUT_ShiftRow);

Gen_MixCols: 
  for I in 0 to 3 generate
    MixColX : entity  work.MixColumns(arch) port map
    (IN_MixColumns		=> IN_MixColumns(32*I + 31 downto 32*I),
		 OUT_MixColumns		=> OUT_MixColumns(32*I + 31 downto 32*I));
  end generate Gen_MixCols;
  
Mux3to1 : entity  work.mux_3to1(arch) port map
	(SEL => SelMux1, A=> DIN, B=> OUT_ShiftRow, C=> OUT_MixColumns, X=> IN_AddRoundKey);


Demux1 : entity work.demux_1to2(arch) port map
	(SEL => SelDemux1, I=> OUT_AddRoundKey, A=> IN_SubBytes, B=> OUTPUT);


IN_MixColumns <= OUT_ShiftRow;

SM : entity work.AES_State_Machine(arch) port map
	(clk => clk, reset => rst, start => start, mux1 => SelMux1, demux1 => SelDemux1, busy => busy, key_en => enable);

FF_DOUT : entity work.FF(arch) port map
	(clk => clk, reset => rst, D => OUTPUT, Q => DOUT);

FF_KEY : entity work.FF(arch) port map
	(clk => clk, reset => rst, D => KIN, Q => Key);
	
IN_ShiftRow <= OUT_SubBytes;

Exp_Key : entity work.Exp_Key(arch) port map
	( kin => Key, clk => clk, enable => enable, kout => kout);
end arch;
