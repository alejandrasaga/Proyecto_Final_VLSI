library ieee;
use ieee.std_logic_1164.all;

ENTITY TOP IS 
PORT(
	clk : IN STD_LOGIC;
	switchCarta: in std_logic_vector(5 downto 0);
	switchRESET: in std_logic;
	LED: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	display0: out std_logic_vector (7 downto 0); --cartas
	display1: out std_logic_vector (7 downto 0);
	display2: out std_logic_vector (7 downto 0);
	display3: out std_logic_vector (7 downto 0);
	display4: out std_logic_vector (7 downto 0);
	display5: out std_logic_vector (7 downto 0));
END ENTITY;

ARCHITECTURE arqTOP OF TOP IS
SIGNAL AVISO: STD_LOGIC;
SIGNAL clkLED: STD_LOGIC;
SIGNAL clkLEDOS: STD_LOGIC;
SIGNAL clkLetras: STD_LOGIC;
BEGIN
	DIV_CLK: ENTITY WORK.reloj(arqReloj) PORT MAP(clk, clkLED, CLKLETRAS);
	CRONO: ENTITY WORK.cronometro(arqcronometro) PORT MAP (clkLED, switchRESET, LED, AVISO);
	DIS: ENTITY WORK.displays(arqDisplays) PORT MAP (clkLETRAS, switchCarta, AVISO, display0,display1,display2,display3,
	display4,display5);
END ARCHITECTURE;