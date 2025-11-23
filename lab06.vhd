library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity lab06 is
port (

	SW: in std_logic_vector(2 downto 0);
	HEX7: out std_logic_vector(0 to 6);
	HEX5: out std_logic_vector(0 to 6);
	HEX3: out std_logic_vector(0 to 6);
	HEX1: out std_logic_vector(0 to 6)
	);
	
end lab06;

architecture logica of lab06 is
 signal soma: std_logic_vector (1 downto 0);
begin
	soma(0) <= sw(0) xor sw(1) xor sw(2);
	soma(1) <= (sw(0) and sw(1)) or (sw(0) and sw(2)) or (sw(1) and sw(2));
with sw(0) select

	HEX7 <= "0000001" when '0',
			  "1001111" when '1',
			  "1111111" when others;

with SW(1) select
	HEX5 <= "0000001" when '0',
			  "1001111" when '1',
			  "1111111" when others;
			  
with SW(2) select
	HEX3 <= "0000001" when '0',
			  "1001111" when '1',
			  "1111111" when others;

with soma select
	HEX1 <= "0000001" when "00",
			  "1001111" when "01",
			  "0010010" when "10",
			  "0000110" when "11",
			  "1111111" when others;

end logica;