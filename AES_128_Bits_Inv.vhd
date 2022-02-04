library IEEE;
use IEEE.std_logic_1164.all;


entity AES_128_Bits_Inv is
port (  KIN : in std_logic_vector(127 downto 0);
        DIN : in std_logic_vector(127 downto 0);
        clk : in std_logic;
        rst : in std_logic;
        start : in std_logic;
        
        DOUT : out std_logic_vector(127 downto 0); 
        busy : out std_logic
);
end AES_128_Bits_Inv;


architecture arch of AES_128_Bits_Inv is
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
signal Kout : std_logic_vector(127 downto 0);
signal KRead : std_logic_vector(127 downto 0);

signal KeyEnable : std_logic;
signal KeyAddr : std_logic_vector(3 downto 0);
signal KeyRW : std_logic;
signal SelMux1 : std_logic;
signal SelMux2 : std_logic;
signal SelDemux1 : std_logic;

begin


AddRoundKey : entity  work.AddRoundKey(arch) port map
  (
    KeyRound => KRead,
    IN_AddRoundKey =>IN_AddRoundKey,
    OUT_AddRoundKey => OUT_AddRoundKey
  );


Gen_InvSubByte: 
  for I in 0 to 7 generate
    SubByteX : entity  work.Double_SubByte(SYN) port map
    (address_a	=> IN_SubBytes(16*I + 7 downto 16*I),
     address_b => IN_SubBytes(16*I + 15 downto 16*I+8),
     clk => clk,
     SBox_invSbox => '1' ,
     q_a => OUT_SubBytes(16*I + 7 downto 16*I),
    q_b	 => OUT_SubBytes(16*I + 15 downto 16*I+8));
  end generate Gen_InvSubByte;
  
InvShiftRow : entity  work.InvShiftRow(arch)port map
(  IN_InvShiftRow => IN_ShiftRow, 
   OUT_InvShiftRow => OUT_ShiftRow);

Gen_InvMixCols: 
  for I in 0 to 3 generate
    InvMixColX : entity  work.InvMixColumns(arch) port map
    (IN_InvMixColumns	=> IN_MixColumns(32*I + 31 downto 32*I),
     OUT_InvMixColumns => OUT_MixColumns(32*I + 31 downto 32*I));
  end generate Gen_InvMixCols;
  
  
Mux2to1 : entity  work.mux_2to1(arch) port map
	(SEL => SelMux1, A=> DIN, B=> OUT_SubBytes, X=> IN_AddRoundKey);

Mux2to12 : entity  work.mux_2to1(arch) port map
	(SEL => SelMux2, A=> IN_MixColumns, B=> OUT_MixColumns, X=> IN_ShiftRow);


Demux1 : entity work.demux_1to2(arch) port map
	(SEL => SelDemux1, I=> OUT_AddRoundKey, A=> IN_MixColumns, B=> OUTPUT);



SM : entity work.AES_State_Machine_Inv(arch) port map
	(clk => clk, reset => rst, start => start, mux1 => SelMux1, mux2 => SelMux2, demux1 => SelDemux1, busy => busy, key_en => KeyEnable, KeyRW => KeyRW, KeyAddr => KeyAddr);

FF_DOUT : entity work.FF(arch) port map
	(clk => clk, reset => rst, D => OUTPUT, Q => DOUT);

FF_KEY : entity work.FF(arch) port map
	(clk => clk, reset => rst, D => KIN, Q => Key);
	


MEM : entity work.KeyMem(arch) port map
  (clk => clk, rst => rst, KeyW => Kout , KeyR => KRead, ADDR => KeyAddr, RW => KeyRW);
  
ExpKey : entity work.Exp_Key(arch) port map( 
   kin => Key,	clk => clk,	enable => KeyEnable,	kout => Kout		);


IN_SubBytes <= OUT_ShiftRow;

end arch;