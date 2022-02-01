library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity KeyMem is
port (  
    KeyW : in std_logic_vector(127 downto 0);
		clk : in std_logic;
		rst : in std_logic;
		RW : in std_logic; -- 0 write and 1 read
		ADDR : in std_logic_vector(3 downto 0);
		KeyR : out std_logic_vector(127 downto 0));

end KeyMem;

architecture arch of KeyMem is
  
type RAM is array (15 downto 0) of std_logic_vector(127 downto 0);
signal memory : RAM;

begin
 process(clk)
 begin 
    if(rising_edge(clk)) then
      if rst = '1' then
        memory <= (others=> x"00000000000000000000000000000000");
        KeyR <= (others=> '0');
      elsif RW = '0' then
       memory(to_integer(unsigned(ADDR))) <= KeyW;
      elsif RW = '1' then
      KeyR <= memory(to_integer(unsigned(ADDR)));
    end if;
  end if;    
 end process;

end arch;
