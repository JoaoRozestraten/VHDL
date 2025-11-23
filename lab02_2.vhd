LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab02_2 IS
PORT( 
	x1, x2 : IN STD_LOGIC;
	f : OUT STD_LOGIC
	);
END lab02_2;

ARCHITECTURE LogicFunction OF lab02_2 IS
BEGIN
	--f <= ((x1 AND x2) OR (NOT x1 AND NOT x2)) OR ((x1 AND NOT x2) OR (NOT x1 AND x2));
	--OU
	f <= (x1 xnor x2) or (x1 or x2);
END LogicFunction;
