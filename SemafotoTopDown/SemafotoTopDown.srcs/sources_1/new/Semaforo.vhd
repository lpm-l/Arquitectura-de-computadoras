----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2024 10:27:37
-- Design Name: 
-- Module Name: Semaforo - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Semaforo is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Verde : out STD_LOGIC;
           Amarillo : out STD_LOGIC;
           Rojo : out STD_LOGIC);
end Semaforo;

architecture Behavioral of Semaforo is

    TYPE Estados is(E0,E1,E2,E3);
    SIGNAL Edo_presente:Estados;
    SIGNAL Edo_siguiente:Estados;
    
begin

    --seccion secuencial
	Process(clk,reset)
	begin
		if(reset='1')then
			Edo_presente <= E0;
		elsif (clk'event and clk='1') then
			Edo_presente <= Edo_siguiente;
		end if;
	end process;

    process(Edo_presente) begin
	
	   Case Edo_presente is
	       when E0 =>
	            Verde <= '1';
			    Amarillo <= '0';
			    Rojo <= '0';
			    Edo_siguiente <= E1;
	       when E1 =>
	            Verde <= '0';
			    Amarillo <= '1';
			    Rojo <= '0';
			    Edo_siguiente <= E2;
	       
	       when E2 =>
	            Verde <= '0';
			    Amarillo <= '0';
			    Rojo <= '1';
			    Edo_siguiente <= E3;
		   when E3 =>
	            Verde <= '0';
			    Amarillo <= '0';
			    Rojo <= '1';
			    Edo_siguiente <= E0;
 
	   end case;
	end process;

end Behavioral;
