--lab9

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.comparar_package.ALL;

entity lab9 is
port(
		SW : IN  STD_LOGIC_VECTOR(10 DOWNTO 3);
		s1, s2, s3 : OUT STD_LOGIC; --equ,grt,lst
		HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6); --b
      HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6); --a
		LEDR : OUT STD_LOGIC_VECTOR(5 DOWNTO 3) --
);
END lab9;

ARCHITECTURE arcm OF lab9 IS
SIGNAL n1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL n2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
n1 <= sw(10 DOWNTO 7); --a
n2 <= sw(6 DOWNTO 3); --b

  Cm0: comparar PORT MAP(
		a => n1,
		b => n2,
		equ => s1,
		grt => s2,
		lst => s3
  );
	with n1 select --A printado pelo HEX2
		HEX2 <= 	"0000001" when "0000",
					"1001111" when "0001",
					"0010010" when "0010",
					"0000110" when "0011",
					"1001100" when "0100",
					"0100100" when "0101",
					"0100000" when "0110",
					"0001111" when "0111",
					"0000000" when "1000",
					"0001100" when "1001",
					"0001000" when "1010",
					"1100000" when "1011",
					"0110001" when "1100",
					"1000010" when "1101",
					"0110000" when "1110",
					"0111000" when "1111",
					"1111111" when others;
					
	with n2 select --B printado pelo HEX1
		HEX1 <= 	"0000001" when "0000",
					"1001111" when "0001",
					"0010010" when "0010",
					"0000110" when "0011",
					"1001100" when "0100",
					"0100100" when "0101",
					"0100000" when "0110",
					"0001111" when "0111",
					"0000000" when "1000",
					"0001100" when "1001",
					"0001000" when "1010",
					"1100000" when "1011",
					"0110001" when "1100",
					"1000010" when "1101",
					"0110000" when "1110",
					"0111000" when "1111",
					"1111111" when others;
					
	LEDR (3) <= s1;
	LEDR (4) <= s2;
	LEDR (5) <= s3;
END arcm;