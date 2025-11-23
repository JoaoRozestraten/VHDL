--pkg_dec2_4
--comparar_package

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE pkg_dec2_4 IS
  COMPONENT dec2_4
    PORT (
        a : in std_logic;
		  b : in std_logic;
		  en : in std_logic;
		  w : out std_logic_vector(3 downto 0)
    );
  END COMPONENT;
END pkg_dec2_4;