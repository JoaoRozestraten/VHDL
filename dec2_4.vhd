-- dec2_4
library ieee;
use ieee.std_logic_1164.all;

entity dec2_4 is 
port
(
	a,b, en : in std_logic;
	w : out std_logic_vector(3 downto 0) 
);
end entity;

architecture acr12 of dec2_4
is
begin 
w(3) <= a and b and en;
w(2) <= a and not b and en;
w(1) <= not a and b and en;
w(0) <= not a and not b and en;
end architecture;