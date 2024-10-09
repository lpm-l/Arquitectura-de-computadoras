----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2024 10:08:23
-- Design Name: 
-- Module Name: Refresos - Behavioral
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

entity Refresos is
    Port ( sensor_vaso : in STD_LOGIC;
           rst : in STD_LOGIC;
           activar_bomba : out STD_LOGIC;
           edo_1 : out STD_LOGIC;
           edo_2 : out STD_LOGIC;
           edo_3 : out STD_LOGIC;
           sensor_lleno : in STD_LOGIC;
           clk : in STD_LOGIC);
end Refresos;

architecture Behavioral of Refresos is

    TYPE Estados is(Inicio,Llenado,Finalizacion);
    SIGNAL Edo_presente:Estados;
    SIGNAL Edo_siguiente:Estados;

begin

    --seccion secuencial
	Process(clk,rst)
	begin
		if(rst='1')then
			Edo_presente <= Inicio;
		elsif (clk'event and clk='1') then
			Edo_presente <= Edo_siguiente;
		end if;
	end process;
	
	--seccion combinacional
	process (Edo_presente,rst)
	begin
		
		case Edo_presente is
			when Inicio =>
			    edo_1 <= '1';
			    edo_2 <= '0';
			    edo_3 <= '0';
                activar_bomba <= '0';
				Edo_siguiente <=Llenado;
	
				if(sensor_vaso = '0') then
				    Edo_siguiente <=Inicio;
				end if;

			when Llenado =>
			    edo_1 <= '0';
			    edo_2 <= '1';
			    edo_3 <= '0';
                activar_bomba <= '1';
				Edo_siguiente <= Llenado;
				if(sensor_lleno = '1') then
				   Edo_siguiente <= Finalizacion; 
				end if;
			when Finalizacion =>
			    edo_1 <= '0';
			    edo_2 <= '0';
			    edo_3 <= '1';
                activar_bomba <= '0';
				Edo_siguiente <= Inicio;
			
		end case;
		
	end process;


end Behavioral;
