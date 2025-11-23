--novo projeto: --Arquivo Principal
--projeto

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;--incluindo a biblioteca
USE work.package_projeto.ALL;--incluindo o package das operações

entity projeto is 
port (
		SW : in std_logic_vector (10 downto 0);
		HEX0 : out std_logic_vector (0 to 6); --ALUOP
		HEX2 : out std_logic_vector (0 to 6); --B
		HEX4 : out std_logic_vector (0 to 6); --A
		HEX6 : out std_logic_vector (0 to 6); --Result
		LEDR : out std_logic_vector (5 downto 0) --cout/zero/overflow/equ/grt/lst (0-5)
);
end projeto;

architecture arc of projeto is
signal a : std_logic_vector (3 downto 0);
signal b : std_logic_vector (3 downto 0);
signal aluop : std_logic_vector (2 downto 0);--contem o opcode da operação (será usado varias vezes em mux, que é representado com select with)
signal vet : std_logic_vector (28 downto 0);--amarzena todas as respostas das operações
signal aluop_p : std_logic;--Faz com que os sinais da comparação só sejam mostrados quano aluop = 111
signal zero_flag : std_logic;
signal cout_f : std_logic;--Controla o c out
signal overflow : std_logic;--Mostra o overflow da soma e da subtração
signal bb : std_logic_vector (3 downto 0);--usado para definir se é soma (b) ou subtração (not b)
signal cc : std_logic;--carry in da soma = 0, já na subtração carry in = 1
signal resfim : std_logic_vector (3 downto 0);--display no hex 6
signal sos, zff : std_logic;--sos serve para o zero flag não ser ativado quando aluop = "000"
signal pa, pb : std_logic_vector (3 downto 0);--pa e pb evitam com que a e b estejam no display quando aluop = "000"
begin
a <= SW(10 downto 7);
b <= SW(6 downto 3);
aluop <= SW(2 downto 0);

with aluop select  --pa e pb evitam com que os hex 2 e 4 mostrem alguma coisa no NOP
		pa <= "0000" when "000",
				a when others;
				
with aluop select
		pb <= "0000" when "000",
				b when others;

with aluop select --not b se for subtração
		bb <= not b when "101",
				b when others;
		
with aluop select --carry in da subtração
		cc <= '1' when "101",
				'0' when others;



op1: e port map( --passando os valores para outro código por meio do package 001 AND
		a => a, --pkg / arq
		b => b,
		res => vet(3 downto 0)-- envia os valores de a e b e recebe o resultado da operação
);

op2: ou port map( --010 OR
		a => a,
		b => b,
		res => vet(7 downto 4)
);

op3: ne port map( --011 NOT
		b => b,
		res => vet(11 downto 8)
);

op4: soma port map( --100 ADD e 101 SUB (mesmo circuito)
		a => a,
		b =>  bb,
		s => vet(15 downto 12),
		cin => cc,
		cout => vet(16)
);


op5: mul port map( --110 MUL
		a => a(1 downto 0),
		b => b(1 downto 0),
		res => vet(25 downto 22)
);

op6: comparar port map( --111 COMP
		a => a,
		b => b,
		equ => vet(26),
		grt => vet(27),
		lst => vet(28)
);


aluop_p <= aluop(0) and aluop(1) and aluop(2);--utilizado para mostrar os sinais da comparação somente em sua respectiva operação

	with pa select
		HEX4 <= 	"0000001" when "0000", --definindo o número que será mostrado no hex (7 seguimentos) de acordo com o número em binário
					"1001111" when "0001",
					"0010010" when "0010",
					"0000110" when "0011",
					"1001100" when "0100",
					"0100100" when "0101",
					"0100000" when "0110",
					"0001111" when "0111",
					"0000000" when "1000",
					"0001100" when "1001",
					"0001000" when "1010",
					"1100000" when "1011",
					"0110001" when "1100",
					"1000010" when "1101",
					"0110000" when "1110",
					"0111000" when "1111",
					"1111111" when others;
					
	with pb select
		HEX2 <= 	"0000001" when "0000",
					"1001111" when "0001",
					"0010010" when "0010",
					"0000110" when "0011",
					"1001100" when "0100",
					"0100100" when "0101",
					"0100000" when "0110",
					"0001111" when "0111",
					"0000000" when "1000",
					"0001100" when "1001",
					"0001000" when "1010",
					"1100000" when "1011",
					"0110001" when "1100",
					"1000010" when "1101",
					"0110000" when "1110",
					"0111000" when "1111",
					"1111111" when others;
					
	with aluop select
		HEX0 <= 	"0000001" when "000",
					"1001111" when "001",
					"0010010" when "010",
					"0000110" when "011",
					"1001100" when "100",
					"0100100" when "101",
					"0100000" when "110",
					"0001111" when "111",
					"1111111" when others;
					
	with aluop select
		resfim <="0000" when "000", --escolher qual das resopstas corresponde a operação escolida
					vet(3 downto 0) when "001",
					vet(7 downto 4) when "010",
					vet(11 downto 8) when "011",
					vet(15 downto 12) when "100",
					vet(15 downto 12) when "101",
					vet(25 downto 22) when "110",
					"0000" when "111",
					"1111" when others;
					
	with resfim select
		HEX6 <= 	"0000001" when "0000",
					"1001111" when "0001",
					"0010010" when "0010",
					"0000110" when "0011",
					"1001100" when "0100",
					"0100100" when "0101",
					"0100000" when "0110",
					"0001111" when "0111",
					"0000000" when "1000",
					"0001100" when "1001",
					"0001000" when "1010",
					"1100000" when "1011",
					"0110001" when "1100",
					"1000010" when "1101",
					"0110000" when "1110",
					"0111000" when "1111",
					"1111111" when others;
					
	with resfim select
		zero_flag <= '1' when "0000",
						 '0' when others;
						 
	with aluop select
		sos <= '0' when "000",
				 '1' when others;
				 
	zff <= sos and zero_flag;
	
	with aluop select
		cout_f <=   vet(16) when "100", --ADD
						vet(16) when "101", --SUB
						'0' when others;	
							
							
							
	with aluop select
		overflow <=   '0' when "000",
							(a(3) and b(3) and (not vet(16))) or ((not a(3)) and (not b(3)) and vet(16)) when "100", --ADD COMPLEMENTO DE 2
							(a(3) and (not b(3)) and (not vet(16))) or ((not a(3)) and b(3) and vet(16)) when "101", --SUB COMPLEMENTO DE 2
							'0' when others;
					
					
	LEDR(3) <= vet(26) and aluop_p; --equ
	LEDR(4) <= vet(27) and aluop_p; --grt
	LEDR(5) <= vet(28) and aluop_p; --lst   when aluop = "111" else '0'; 
	
	LEDR(1) <= zff; --zeroflag
	LEDR(0) <= cout_f; --Cout
	LEDR(2) <= overflow; --Overflow
	
	
	end arc;