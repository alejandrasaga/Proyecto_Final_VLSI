library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY cronometro IS
PORT(
	clk : IN STD_LOGIC; --Reloj para el contador de tiempo
	swRESET: IN STD_LOGIC;--Reset para reiniciar juego
	LED: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);--Leds indican tiempo 
	aviso: OUT STD_LOGIC--señal que avisa si ya acabo el tiempo
);
END ENTITY;

ARCHITECTURE arqcronometro OF cronometro IS
SIGNAL CTALED : STD_LOGIC_VECTOR(9 downto 0); --señal que envia los datos a la salida
signal conteo: std_logic;
signal conteoLED: STD_LOGIC_VECTOR(3 downto 0);
-----------------------------------------------
SIGNAL avisoSignal: STD_LOGIC;
BEGIN

	CUENTA_LEDS: process (clk, swRESET)	---LLEVA LA CUENTA EN LOS LEDS PARA EL TIEMPO
	BEGIN
		if(clk'event and clk='1') then
			IF(conteoLED = "1010") then
				avisoSignal <= '1';--INDICA QUE YA ACABO EL TIEMPO
				conteoLED <= "0000";
			ELSE
				avisoSignal <= '0'; 
				conteoLED <= conteoLED +1;
						case conteoLED is 
							when "0000" => CTALED <= "1000000000";
							when "0001" => CTALED <= "1100000000";
							when "0010" => CTALED <= "1110000000";
							when "0011" => CTALED <= "1111000000";
							when "0100" => CTALED <= "1111100000";
							when "0101" => CTALED <= "1111110000";
							when "0110" => CTALED <= "1111111000";
							when "0111" => CTALED <= "1111111100";
							when "1000" => CTALED <= "1111111110";
							when "1001" => CTALED <= "1111111111";
							when others => CTALED <="0000000000";
						END CASE;
			END IF;
		end if;
	  
	  IF(swRESET = '1') THEN
		conteoLED <= "0000";
		END IF;
	END PROCESS;
	LED <= CTALED;
	aviso <= avisoSignal;

END ARCHITECTURE;