library IEEE;
use IEEE.std_logic_1164.all;


entity AES_128_Bits is
port (  KIN : in std_logic_vector(127 downto 0);
        DIN : in std_logic_vector(127 downto 0);
        clk : in std_logic;
        rst : in std_logic;
        start : in std_logic;
        
        DOUT : out std_logic_vector(127 downto 0); 
        busy : out std_logic
);
end AES_128_Bits;


architecture arch of AES_128_Bits is

signal INPUT : std_logic_vector(127 downto 0);

signal IN_SubBytes : std_logic_vector(127 downto 0);
signal OUT_SubBytes : std_logic_vector(127 downto 0);
signal IN_AddRoundKey : std_logic_vector(127 downto 0);
signal OUT_AddRoundKey : std_logic_vector(127 downto 0);
signal IN_ShiftRow : std_logic_vector(127 downto 0);
signal OUT_ShiftRow : std_logic_vector(127 downto 0);
signal IN_MixColumns : std_logic_vector(127 downto 0);
signal OUT_MixColumns : std_logic_vector(127 downto 0);


signal Key : std_logic_vector(127 downto 0);

signal SelMux1 : std_logic_vector(1 downto 0);
signal OUT_en : std_logic;

begin


AddRoundKey : entity  work.AddRoundKey(arch) port map
  ( KeyRound => Key, IN_AddRoundKey =>IN_AddRoundKey, OUT_AddRoundKey => OUT_AddRoundKey );


Gen_SubByte: 
  for I in 0 to 7 generate
    SubByteX : entity  work.Double_SubByte(SYN) port map
    (address_a	=> IN_SubBytes(16*I + 7 downto 16*I),
     address_b => IN_SubBytes(16*I + 15 downto 16*I+8),
     clk => clk,
    SBox_invSbox => '0' ,
    q_a => OUT_SubBytes(16*I + 7 downto 16*I),
    q_b => OUT_SubBytes(16*I + 15 downto 16*I+8));
  end generate Gen_SubByte;
  
ShiftRow : entity  work.ShiftRow(arch)port map
(  IN_ShiftRow => IN_ShiftRow, OUT_ShiftRow => OUT_ShiftRow);

Gen_MixCols: 
  for I in 0 to 3 generate
    MixColX : entity  work.MixColumns(arch) port map
    (IN_MixColumns => IN_MixColumns(32*I + 31 downto 32*I),
     OUT_MixColumns => OUT_MixColumns(32*I + 31 downto 32*I));
  end generate Gen_MixCols;
  
Mux3to1 : entity  work.mux_3to1(arch) port map
	(SEL => SelMux1, A=> INPUT, B=> OUT_ShiftRow, C=> OUT_MixColumns, X=> IN_AddRoundKey);

SM : entity work.AES_State_Machine(arch) port map
	(clk => clk, reset => rst, start => start, mux1 => SelMux1, OUT_en => OUT_en, busy => busy, key_en => open);

FF_DOUT : entity work.FF2(arch) port map
	(clk => clk, enable => OUT_en, reset => rst, D => OUT_AddRoundKey, Q => DOUT);

FF_DIN : entity work.FF(arch) port map
	(clk => clk, reset => rst, D => DIN, Q => INPUT);

FF_KEY : entity work.FF(arch) port map
	(clk => clk, reset => rst, D => KIN, Q => Key);
	
IN_SubBytes <= OUT_AddRoundKey;
IN_MixColumns <= OUT_ShiftRow;
IN_ShiftRow <= OUT_SubBytes;
end arch;