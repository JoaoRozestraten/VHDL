--lab10_2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.pkg_mux_8_1.ALL;

entity lab10_2 is
port(
		SW : IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(1 downto 0) --saida
);
END lab10_2;

ARCHITECTURE arcmmmm OF lab10_2 IS
SIGNAL n1 : STD_LOGIC;
BEGIN


lynn: mux8_1 port map(
	s => sw(7 downto 0),
	c => sw(10 downto 8),
	a => n1
);

					
					
	LEDR (0) <= n1;

	
END arcmmmm;