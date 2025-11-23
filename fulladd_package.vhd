--fulladd_package

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE fulladd_package IS
  COMPONENT fulladd
    PORT (
      Cin  : IN  STD_LOGIC;
      x, y : IN  STD_LOGIC;
      s    : OUT STD_LOGIC;
      Cout : OUT STD_LOGIC
    );
  END COMPONENT;
END fulladd_package;