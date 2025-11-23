--comparar_package

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE comparar_package IS
  COMPONENT comparar
    PORT (
        a : in std_logic_vector(3 downto 0);
		  b : in std_logic_vector(3 downto 0);
		  equ : out std_logic;
		  grt : out std_logic;
		  lst : out std_logic
    );
  END COMPONENT;
END comparar_package;