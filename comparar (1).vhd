--comparar

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity comparar is 
port(
		  a : in  std_logic_vector(3 downto 0);--primeiro numero
		  b : in  std_logic_vector(3 downto 0);--segundo numero
		  equ : out std_logic;--equ=1 signific que a == b
		  grt : out std_logic;--grt=1 significa que a > b
		  lst : out std_logic--lst=1 significa que a < b
);
end comparar;

ARCHITECTURE arc OF comparar IS
	SIGNAL i : STD_LOGIC_VECTOR(3 DOWNTO 0);--sinais internos da formação do equ
BEGIN
	i(0) <= a(0) xnor b(0); 
	i(1) <= a(1) xnor b(1);
	i(2) <= a(2) xnor b(2);
	i(3) <= a(3) xnor b(3);

	equ <= i(0) and i(1) and i(2) and i(3);

	grt <= (a(3) and not b(3)) or (i(3) and a(2) and not b(2)) or (i(3) and i(2) and a(1) and not b(1)) or (i(3) and i(2) and i(1) and a(0) and not b(0));
			 
	lst <= equ nor grt;
END arc;