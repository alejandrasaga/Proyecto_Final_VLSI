library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity reloj is --divisores de frecuencia 
port(
	clk1 : in std_logic;
	clkLED: BUFFER std_logic := '0';
	clkLETRAS: BUFFER std_logic := '0');
end entity;

architecture arqReloj of reloj is
	signal conteo: integer range 0 to 100000000;--100,000,000
	signal conteo2: integer range 0 to 50000000;--50,000,000
BEGIN
		LENTO: process(clk1) --clk lento para los LEDS, es decir llevara la cuenta 
		begin
			if (clk1' event and clk1 = '1') then
				conteo <= conteo + 1; 
				if (conteo = 100000000) then
					conteo <= 0;
					clkLED <= not(clkLED);
				end if;
			end if;
		end process;
		
		GAME_OVER : process(clk1)
		BEGIN
			if (clk1' event and clk1 = '1') then
				conteo2 <= conteo2 + 1; 
				if (conteo2 = 5000000) then
						conteo2 <= 0;
					clkLETRAS <= not(clkLETRAS);
				end if;
			end if;
		END PROCESS;
		
		
END;
