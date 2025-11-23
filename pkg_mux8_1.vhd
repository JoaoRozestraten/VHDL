--pkg_mux8_1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE pkg_mux_8_1 IS
  COMPONENT mux8_1
    PORT (
	 
	 a : out std_logic;
	 s : in std_logic_vector (7 downto 0);
	 c : in std_logic_vector (2 downto 0)

    );
  END COMPONENT;
END pkg_mux_8_1;