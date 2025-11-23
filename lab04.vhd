library ieee;
use ieee.std_logic_1164.all;

entity lab04 is 
port (

	sw: in std_logic_vector (2 downto 0);
	ledr: out std_logic_vector (1 downto 0)
	);
end entity lab04;

architecture bhv of lab04 is 
begin 
LEDR (0) <= (sw(0) xor sw(1) xor sw(2));
LEDR (1) <= (sw(0) and sw(1)) or (sw(0) and sw(2)) or (sw(1) and sw(2)); 
end architecture bhv;