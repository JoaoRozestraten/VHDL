library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity lab07 is
port (

	SW: in std_logic_vector(8 downto 0);
	HEX7: out std_logic_vector(0 to 6);
	HEX5: out std_logic_vector(0 to 6);
	HEX3: out std_logic_vector(0 to 6);
	HEX1: out std_logic_vector(0 to 6);
	HEX0: out std_logic_vector(0 to 6)
	);
	
end lab07;

architecture logica of lab07 is
 signal soma: std_logic_vector(3 downto 0);
 signal c: std_logic_vector(4 downto 0);
 signal a: std_logic_vector(3 downto 0);
 signal b: std_logic_vector(3 downto 0);
 begin
	c(0) <= SW(0);
	soma(0) <= SW(5) xor SW(1) xor c(0);
	c(1) <= (c(0) and SW(1)) or (c(0) and SW(5)) or (SW(1) and SW(5));
	soma(1) <= SW(6) xor SW(2) xor c(1);
	c(2) <= (c(1) and SW(2)) or (c(1) and SW(6)) or (SW(2) and SW(6));
	soma(2) <= SW(7) xor SW(3) xor c(2);
	c(3) <= (c(2) and SW(3)) or (c(2) and SW(7)) or (SW(3) and SW(7));
	soma(3) <= SW(8) xor SW(4) xor c(3);
	c(4) <= (c(3) and SW(4)) or (c(3) and SW(8)) or (SW(4) and SW(8));
	a(0) <= SW(5);
	a(1) <= SW(6);
	a(2) <= SW(7);
	a(3) <= SW(8);
	b(0) <= SW(1);
	b(1) <= SW(2);
	b(2) <= SW(3);
	b(3) <= SW(4);
	with C(4) select
		HEX7 <= 	"0000001" when '0',
					"1001111" when '1',
					"1111111" when others;
	with soma select
		HEX5 <= 	"0000001" when "0000",
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
	with a select
		HEX3 <= 	"0000001" when "0000",
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
	with b select
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
	with c(0) select
		HEX0 <= 	"0000001" when '0',
					"1001111" when '1',
					"1111111" when others;
end logica;