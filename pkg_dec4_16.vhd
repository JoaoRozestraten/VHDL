--pkg_dec4_16

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE pkg_dec4_16 IS
  COMPONENT dec4_16
    PORT (
	 
	 y1,y0,r0,r1 : in std_logic;
	 s : out std_logic_vector (15 downto 0)

    );
  END COMPONENT;
END pkg_dec4_16;