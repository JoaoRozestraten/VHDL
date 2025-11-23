--mux8_1

library ieee;
use ieee.std_logic_1164.all;
USE work.pkg_mux2_1.ALL;

entity mux8_1 is
port
(
	 a : out std_logic;
	 s : in std_logic_vector (7 downto 0);
	 c : in std_logic_vector (2 downto 0)
);
end entity;

architecture lahhh of mux8_1 is
signal
intermed : std_logic_vector(5 downto 0);

begin 

lynop1: mux2_1 port map (
	a => intermed(0),
	s => s(1 downto 0),
   c => c(0)
);

lynop2: mux2_1 port map (
	a => intermed(1),
	s => s(3 downto 2),
   c => c(0)
);

lynop3: mux2_1 port map (
	a => intermed(2),
	s => s(5 downto 4),
   c => c(0)
);

lynop4: mux2_1 port map (
	a => intermed(3),
	s => s(7 downto 6),
   c => c(0)
);

ly1: mux2_1 port map (
	a => intermed(4),
	s => intermed(1 downto 0),
	c => c(1)
);

ly2: mux2_1 port map (
	a => intermed(5),
	s => intermed(3 downto 2),
	c => c(1)
);

y: mux2_1 port map (
	a => a,
	s => intermed(2 downto 1),
	c => c(2)
);

end architecture;