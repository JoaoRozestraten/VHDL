--pkg_mux2_1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE pkg_mux2_1 IS
  COMPONENT mux2_1
    PORT (
        a : out std_logic;
		  c : in std_logic;
		  s : in std_logic_vector(1 downto 0)
    );
  END COMPONENT;
END pkg_mux2_1;