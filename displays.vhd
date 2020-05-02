library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY displays IS
port(
	--clk: in std_logic; --reloj para las cartas
	switchCarta: in std_logic_vector(5 downto 0); --selector de carta
	aviso: in std_logic;
	display0: out std_logic_vector (7 downto 0); --cartas
	display1: out std_logic_vector (7 downto 0);
	display2: out std_logic_vector (7 downto 0);
	display3: out std_logic_vector (7 downto 0);
	display4: out std_logic_vector (7 downto 0);
	display5: out std_logic_vector (7 downto 0));
END ENTITY;

ARCHITECTURE arqDisplays OF displays IS
CONSTANT CARTA_PAR1 :std_logic_vector(7 downto 0):="00000100"; --carta par 1
CONSTANT CARTA_PAR2 :std_logic_vector(7 downto 0):="00010100"; --carta par 2
CONSTANT CARTA_PAR3 :std_logic_vector(7 downto 0):="00010000"; --carta par 3
CONSTANT APAGADAS: std_logic_vector(7 downto 0) := "11111111";	--no muestra ninguna carta
--------------------------------------------------------------------
CONSTANT letra_G: STD_LOGIC_VECTOR(7 downto 0) := "10000010";
CONSTANT letra_o: STD_LOGIC_VECTOR(7 downto 0) := "10100011";--O minuscula
CONSTANT letra_d: STD_LOGIC_VECTOR(7 downto 0) := "10100001";
CONSTANT letra_L: STD_LOGIC_VECTOR(7 downto 0) := "11000111";
CONSTANT letra_S: STD_LOGIC_VECTOR(7 downto 0) := "10010010";
CONSTANT letra_E: STD_LOGIC_VECTOR(7 downto 0) := "10000110";
--------------------------------------------------------------------
SIGNAL Dis0 : STD_LOGIC_VECTOR(7 downto 0);--SEÑALES PARA MANIPULAR DISPLAYS
SIGNAL Dis1 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL Dis2 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL Dis3 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL Dis4 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL Dis5 : STD_LOGIC_VECTOR(7 downto 0);
--------------------------------------------------------------------
SIGNAL conteo: integer range 0 to 2;
BEGIN

	CARTAS_JUEGO: PROCESS (switchCarta, aviso)
	BEGIN
	if(aviso = '0') and (conteo < 2) then
		if (switchCarta = "010001") then
			Dis0 <= CARTA_PAR1;
			Dis1 <= APAGADAS;
			Dis2 <= APAGADAS;
			Dis3 <= APAGADAS;
			Dis4 <= CARTA_PAR1;
			Dis5 <= APAGADAS;
			conteo <= conteo +1;
		
		elsif (switchCarta = "100100") then
			Dis0 <= APAGADAS;
			Dis1 <= APAGADAS;
			Dis2 <= CARTA_PAR2;
			Dis3 <= APAGADAS;
			Dis4 <= APAGADAS;
			Dis5 <= CARTA_PAR2;
			conteo <= conteo +1;
		
		elsif (switchCarta = "001010") then
			Dis0 <= APAGADAS;
			Dis1 <= CARTA_PAR3;
			Dis2 <= APAGADAS;
			Dis3 <= CARTA_PAR3;
			Dis4 <= APAGADAS;
			Dis5 <= APAGADAS;
			conteo <= conteo +1;
		
		elsif (switchCarta = "000001") then
			Dis0 <= CARTA_PAR1;
			Dis1 <= APAGADAS;
			Dis2 <= APAGADAS;
			Dis3 <= APAGADAS;
			Dis4 <= APAGADAS;
			Dis5 <= APAGADAS;
			
		elsif (switchCarta = "000010") then
			Dis1 <= CARTA_PAR3;
			Dis0 <= APAGADAS;
			Dis2 <= APAGADAS;
			Dis3 <= APAGADAS;
			Dis4 <= APAGADAS;
			Dis5 <= APAGADAS;
			
		elsif (switchCarta = "000100") then
			Dis2 <= CARTA_PAR2;
			Dis1 <= APAGADAS;
			Dis0 <= APAGADAS;
			Dis3 <= APAGADAS;
			Dis4 <= APAGADAS;
			Dis5 <= APAGADAS;
			
		elsif (switchCarta = "001000") then
			Dis3 <= CARTA_PAR3;
			Dis1 <= APAGADAS;
			Dis2 <= APAGADAS;
			Dis0 <= APAGADAS;
			Dis4 <= APAGADAS;
			Dis5 <= APAGADAS;
		
		elsif (switchCarta = "010000") then
			Dis4 <= CARTA_PAR1;
			Dis1 <= APAGADAS;
			Dis2 <= APAGADAS;
			Dis3 <= APAGADAS;
			Dis0 <= APAGADAS;
			Dis5 <= APAGADAS;
			
		elsif (switchCarta = "100000") then
			Dis5 <= CARTA_PAR2;
			Dis1 <= APAGADAS;
			Dis2 <= APAGADAS;
			Dis3 <= APAGADAS;
			Dis4 <= APAGADAS;
			Dis0 <= APAGADAS;
		
		else 
			Dis0 <= APAGADAS;
			Dis1 <= APAGADAS;
			Dis2 <= APAGADAS;
			Dis3 <= APAGADAS;
			Dis4 <= APAGADAS;
			Dis5 <= APAGADAS;
		end if;
	elsif(aviso = '1' and conteo <2) then
		Dis0 <= APAGADAS;
		Dis1 <= letra_E;
		Dis2 <= letra_S;
		Dis3 <= letra_o;
		Dis4 <= letra_L;
		Dis5 <= APAGADAS;
	
	elsif(aviso ='0' and conteo = 2) then
		Dis0 <= APAGADAS;
		Dis1 <= letra_d;
		Dis2 <= letra_O;
		Dis3 <= letra_o;
		Dis4 <= letra_G;
		Dis5 <= APAGADAS;
	end if;
	END PROCESS;
	
	display0 <= dis0;
	display1 <= dis1;
	display2 <= dis2;
	display3 <= dis3;
	display4 <= dis4;
	display5 <= dis5;

END;