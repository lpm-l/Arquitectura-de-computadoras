----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2024 10:36:02
-- Design Name: 
-- Module Name: union_semaforos - Behavioral
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

entity union_semaforos is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Verde1 : out STD_LOGIC;
           Amarillo1 : out STD_LOGIC;
           Rojo1 : out STD_LOGIC;
           Verde2 : out STD_LOGIC;
           Amarillo2 : out STD_LOGIC;
           Rojo2 : out STD_LOGIC);
end union_semaforos;

architecture Behavioral of union_semaforos is

    component Reloj 
        Port ( clk : in STD_LOGIC;
               clk_out : out STD_LOGIC);
    end component;
    
    component Semaforo
        Port (  clk : in STD_LOGIC;
                reset : in STD_LOGIC;
                Verde : out STD_LOGIC;
                Amarillo : out STD_LOGIC;
                Rojo : out STD_LOGIC);
    end component;

    signal clk_interno: STD_LOGIC;

begin

    divisorFrecuencia: Reloj
    Port map(clk => clk,
             clk_out => clk_interno);
             
    semaforo1: Semaforo
    Port map(clk => clk_interno,
             reset => reset,
             Verde => Verde1,
             Amarillo => Amarillo1,
             Rojo => Rojo1);
             
    semaforo2: Semaforo
    Port map(clk => clk_interno,
             reset => reset,
             Verde => Verde2,
             Amarillo => Amarillo2,
             Rojo => Rojo2);


end Behavioral;
