-- mux2_1
library ieee;
use ieee.std_logic_1164.all;

entity mux2_1 is 
port
(
	     a : out std_logic;
		  c : in std_logic;
		  s : in std_logic_vector(1 downto 0)
);
end entity;

architecture acr123 of mux2_1
is
begin 
with c select
		a <= s(1) when '1',
			  s(0) when '0',
			  '0' when others; 

end architecture;