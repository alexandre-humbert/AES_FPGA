library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity AES_State_Machine is
port (  clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        
        mux1 : out std_logic_vector(1 downto 0);
        demux1 : out std_logic; 
	      demux2 : out std_logic;
	      key_en : out std_logic;
        busy : out std_logic
);
  
end AES_State_Machine;

architecture arch of AES_State_Machine is
type t_State is (READY, RUNNING, FROUND, LROUND);
  
signal State : t_State;
signal Round : std_logic_vector(3 downto 0);

begin
 
process (clk)
begin

if rising_edge(clk) then
if reset = '1' then
	State <= READY;
	Round <= "0000";
	busy <= '0';
        key_en <= '0';
elsif start ='1' then
	State <= FROUND;
else
	case State is
		when RUNNING =>
			busy <= '1';
			mux1 <= "10";
			demux1 <= '0';
			Round <= std_logic_vector( unsigned(Round) + 1);
			if Round = "1000" then
				State <= LROUND;
			end if;
		when FROUND =>
			busy <= '1';
			mux1 <= "00";
			demux1 <= '0';
			State <= RUNNING;
			key_en <= '1';

		when LROUND =>
			busy <= '1';
			mux1 <= "01";
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
