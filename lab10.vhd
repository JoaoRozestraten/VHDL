--lab10

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.pkg_dec4_16.ALL;

entity lab10 is
port(
		SW : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6); --b
      HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6); --a
		LEDR : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) --saida
);
END lab10;

ARCHITECTURE arcm OF lab10 IS
SIGNAL n1 : STD_LOGIC;
SIGNAL n2 : STD_LOGIC;
SIGNAL n3 : STD_LOGIC;
SIGNAL n4 : STD_LOGIC;
signal saida : std_logic_vector(15 downto 0);
signal h1 : std_logic_vector(1 downto 0);
signal h2 : std_logic_vector(1 downto 0);
BEGIN

n1 <= sw(0);
n2 <= sw(1);
n3 <= sw(2);
n4 <= sw(3);

h1(0) <= n1;
h1(1) <= n2;

h2(0) <= n3;
h2(1) <= n4;



lop0: dec4_16 port map(
	y1 => n1,
	y0 => n2,
	r0 => n3,
	r1 => n4,
	s => saida
);


	with h1 select --A printado pelo HEX2
		HEX2 <= 	"0000001" when "00",
					"1001111" when "01",
					"0010010" when "10",
					"0000110" when "11",
					"1111111" when others;
					
	with h2 select --A printado pelo HEX2
		HEX1 <= 	"0000001" when "00",
					"1001111" when "01",
					"0010010" when "10",
					"0000110" when "11",
					"1111111" when others;
					
					
	LEDR (0) <= saida(0);
	LEDR (1) <= saida(1);
	LEDR (2) <= saida(2);
	LEDR (3) <= saida(3);
	LEDR (4) <= saida(4);
	LEDR (5) <= saida(5);
	LEDR (6) <= saida(6);
	LEDR (7) <= saida(7);
	LEDR (8) <= saida(8);
	LEDR (9) <= saida(9);	
	LEDR (10) <= saida(10);
	LEDR (11) <= saida(11);
	LEDR (12) <= saida(12);
	LEDR (13) <= saida(13);
	LEDR (14) <= saida(14);
	LEDR (15) <= saida(15);
	
END arcm;