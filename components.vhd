library IEEE;
use IEEE.std_logic_1164.all;

entity FF is 
   port(
      Q : out std_logic_vector(127 downto 0);    
      clk :in std_logic;
      reset : in std_logic; 
      D :in  std_logic_vector(127 downto 0)    
   );
end FF;

architecture arch of FF is  
begin  
 process(clk)
 begin 
    if(rising_edge(clk)) then
     if(reset = '1') then 
    Q <= (others => '0');
   else 
    Q <= D; 
   end if; 
    end if;       
 end process;  
end arch; 

library IEEE;
use IEEE.std_logic_1164.all;

entity mux_2to1 is
    Port ( SEL : in  std_logic;
           A   : in  std_logic_vector(127 downto 0);
           B   : in  std_logic_vector(127 downto 0);
           X   : out std_logic_vector(127 downto 0));
end mux_2to1;

architecture arch of mux_2to1 is
begin
    X <= A when (SEL = '0') else B;
end arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity mux_3to1 is
    Port ( SEL : in  std_logic_vector(1 downto 0);
           A   : in  std_logic_vector(127 downto 0);
           B   : in  std_logic_vector(127 downto 0);
           C   : in  std_logic_vector(127 downto 0);
           X   : out std_logic_vector(127 downto 0));
end mux_3to1;

architecture arch of mux_3to1 is
begin
p_mux : process(A,B,C,SEL)
begin
  case SEL is
    when "00" => X <= A ;
    when "01" => X <= B ;
    when "10" => X <= C ;
    when others => X <= A ;
  end case;
end process p_mux;

end arch;


library IEEE;
use IEEE.std_logic_1164.all;

entity demux_1to2 is
 port(
 
 I : in std_logic_vector(127 downto 0);
 SEL: in std_logic;
 A,B: out std_logic_vector(127 downto 0)
 );
end demux_1to2;
 
architecture arch of demux_1to2 is
begin

A <= I when SEL = '0' else (others => '0');
B <= I when SEL = '1' else (others => '0');
 
end arch;



