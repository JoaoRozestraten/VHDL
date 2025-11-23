--fulladd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fulladd IS
  PORT (
    Cin  : IN  STD_LOGIC;   -- Carry in
    x, y : IN  STD_LOGIC;   -- Bits a serem somados
    s    : OUT STD_LOGIC;   -- Sum bit
    Cout : OUT STD_LOGIC    -- Carry out
  );
END fulladd;

ARCHITECTURE LogicFunc OF fulladd IS
BEGIN
  -- Soma: bit a bit com carry
  s    <= x XOR y XOR Cin;
  -- Carry: quando dois ou mais sinais são '1'
  Cout <= (x AND y)
        OR (Cin AND x)
        OR (Cin AND y);
END LogicFunc;