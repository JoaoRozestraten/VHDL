--mult2x2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.fulladd_package.ALL;

ENTITY mult2x2 IS
  PORT (
    SW    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);  -- SW3:SW2 = m, SW1:SW0 = q
    HEX7  : OUT STD_LOGIC_VECTOR(0 TO 6);     -- Produto (4 bits)
    HEX5  : OUT STD_LOGIC_VECTOR(0 TO 6);     -- m
    HEX3  : OUT STD_LOGIC_VECTOR(0 TO 6)      -- q
  );
END mult2x2;

ARCHITECTURE Behavior OF mult2x2 IS
  SIGNAL m     : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL q     : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL pp0, pp1, pp2, pp3 : STD_LOGIC;
  SIGNAL s1, c1, s2, c2     : STD_LOGIC;
  SIGNAL prod : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  -- Atribuição dos operandos
  m <= SW(3 DOWNTO 2);
  q <= SW(1 DOWNTO 0);

  -- Geração de produtos parciais (AND gates)
  pp0 <= m(0) AND q(0);
  pp1 <= m(1) AND q(0);
  pp2 <= m(0) AND q(1);
  pp3 <= m(1) AND q(1);

  -- Soma dos parciais via full-adders
  fa0: fulladd PORT MAP(
    Cin  => '0',
    x    => pp1,
    y    => pp2,
    s    => s1,
    Cout => c1
  );

  fa1: fulladd PORT MAP(
    Cin  => c1,
    x    => pp3,
    y    => '0',
    s    => s2,
    Cout => c2
  );

  -- produto final
  prod(0) <= pp0;
  prod(1) <= s1;
  prod(2) <= s2;
  prod(3) <= c2;

  -- Decodificadores de 7 segmentos (estilo with/select):
  with prod SELECT
    HEX7 <=
      "0000001" WHEN "0000",  -- 0
      "1001111" WHEN "0001",  -- 1
      "0010010" WHEN "0010",  -- 2
      "0000110" WHEN "0011",  -- 3
      "1001100" WHEN "0100",  -- 4
      "0100100" WHEN "0101",  -- 5
      "0100000" WHEN "0110",  -- 6
      "0001111" WHEN "0111",  -- 7
      "0000000" WHEN "1000",  -- 8
      "0001100" WHEN "1001",  -- 9
      "1111111" WHEN OTHERS;   -- off

  with m SELECT
    HEX5 <=
      "0000001" WHEN "00",    -- 0
      "1001111" WHEN "01",    -- 1
      "0010010" WHEN "10",    -- 2
      "0000110" WHEN "11",    -- 3
      "1111111" WHEN OTHERS;

  with q SELECT
    HEX3 <=
      "0000001" WHEN "00",    -- 0
      "1001111" WHEN "01",    -- 1
      "0010010" WHEN "10",    -- 2
      "0000110" WHEN "11",    -- 3
      "1111111" WHEN OTHERS;

END Behavior;