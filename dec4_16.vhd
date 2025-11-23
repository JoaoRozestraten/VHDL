--dec4_16

library ieee;
use ieee.std_logic_1164.all;
USE work.pkg_dec2_4.ALL;

entity dec4_16 is
port
(
	y1,y0,r0,r1 : in std_logic;
	s: out std_logic_vector(15 downto 0)
);
end entity;

architecture lah of dec4_16 is
signal
intermed : std_logic_vector(3 downto 0);

begin 

op1: dec2_4 port map (
	a => y1,
	b => y0,
	en => '1',
	w => intermed
);

op2: dec2_4 port map (
	a => r0,
	b => r1,
	en => intermed(0),
	w => s(3 downto 0)
);

op3: dec2_4 port map (
	a => r0,
	b => r1,
	en => intermed(1),
	w => s(7 downto 4)
);

op4: dec2_4 port map (
	a => r0,
	b => r1,
	en => intermed(2),
	w => s(11 downto 8)
);

op5: dec2_4 port map (
	a => r0,
	b => r1,
	en => intermed(3),
	w => s(15 downto 12)
);
end architecture;
