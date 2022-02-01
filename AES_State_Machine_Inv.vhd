
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity AES_State_Machine_Inv is
port (  clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        
        mux1 : out std_logic;
        mux2 : out std_logic;
        demux1 : out std_logic; 
	      key_en : out std_logic;
	      KeyRW : out std_logic;
	      KeyAddr : out std_logic_vector(3 downto 0);
        busy : out std_logic
);
  
end AES_State_Machine_Inv;

architecture arch of AES_State_Machine_Inv is
type t_State is (KEYGEN, READY, RUNNING, FROUND, LROUND, BOOT);
  
signal State : t_State;
signal Round : std_logic_vector(3 downto 0);
signal ADDR : std_logic_vector(3 downto 0);

begin
 
process (clk)
begin
KeyAddr <= ADDR;

if rising_edge(clk) then
if reset = '1' then
	State <= READY;
	Round <= "0000";
	busy <= '0';
  key_en <= '0';
  KeyRW <= '0';
 	mux1 <= '0';
	mux2 <= '0';
	demux1 <= '0';
  ADDR <= "1111";
elsif start ='1' then
	State <= KEYGEN;
else
	case State is
	  
	  	when KEYGEN =>
		  busy <= '1';
		  key_en <= '1';
		  KeyRW <= '0';
			if ADDR = "1010" then
				State <= BOOT;
				KeyRW <= '1';
			else
			  ADDR <= std_logic_vector( unsigned(ADDR) + 1);
			end if;
			
		when BOOT =>
		  State <= FROUND;
			
			
	  	when FROUND =>
			busy <= '1';
			mux1 <= '0';
			mux2 <= '0';
			demux1 <= '0';
			State <= RUNNING;
			key_en <= '1';
			KeyRW <= '1';
			ADDR <= std_logic_vector( unsigned(ADDR) - 1);


		when RUNNING =>
			busy <= '1';
			mux1 <= '1';
			mux2 <= '1';
			demux1 <= '0';
			Round <= std_logic_vector( unsigned(Round) + 1);
			ADDR <= std_logic_vector( unsigned(ADDR) - 1);
			if Round = "1000" then
				State <= LROUND;
			end if;
			
		when LROUND =>
			busy <= '1';
			mux1 <= '1';
			mux2 <= '1';
			demux1 <= '1';
			State <= READY;
			
			
		when READY =>
			busy <= '0';
			Round <= "0000";
			demux1 <= '0';
			key_en <= '0';
		  
		when others =>
			busy <= '0';


	end case;
end if;
end if;

end process;
  
end arch;
