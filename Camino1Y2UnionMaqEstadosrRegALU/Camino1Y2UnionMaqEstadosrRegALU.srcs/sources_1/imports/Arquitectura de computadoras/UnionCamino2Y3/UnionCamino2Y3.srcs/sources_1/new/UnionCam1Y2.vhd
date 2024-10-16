----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2024 09:34:45
-- Design Name: 
-- Module Name: UnionCam1Y2 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UnionCam1Y2 is
    Port ( clk_pc : in STD_LOGIC;
           clk_MemInstrucciones : in STD_LOGIC;
           clk_RAM_E : in STD_LOGIC;
           clk_RAM_L : in STD_LOGIC;
           clk_RegALU : in STD_LOGIC;
           reset : in STD_LOGIC;
           funcion : out STD_LOGIC_VECTOR (5 downto 0);
           C : in STD_LOGIC_VECTOR (2 downto 0));
end UnionCam1Y2;

architecture Behavioral of UnionCam1Y2 is

    component Union
        Port ( clk_pc : in STD_LOGIC;
           clk_MemInstrucciones : in STD_LOGIC;
           reset : in STD_LOGIC;
           instruccion : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component Union_Ram_Decodificador_Suma
        Port ( clk_RAM_L : in STD_LOGIC;
           clk_RAM_E : in STD_LOGIC;
           clk_RegALU : in STD_LOGIC;
           C: in STD_LOGIC_VECTOR (2 downto 0); --Esta entrada simula el controlador de la ALU, como todavia no esta ponemos esta entrada para decidir que operacion hacer
    instruccion : in STD_LOGIC_VECTOR (31 downto 0);
    funcion : out STD_LOGIC_VECTOR (5 downto 0));
    end component;
    
    signal instruccion_interna: STD_LOGIC_VECTOR (31 downto 0);

begin

    camino_1: Union
        Port map( clk_pc => clk_pc,
                  clk_MemInstrucciones => clk_MemInstrucciones,
                  reset => reset,
                  instruccion => instruccion_interna);
                  
    camino_2: Union_Ram_Decodificador_Suma
        Port map( clk_RAM_L => clk_RAM_L,
                  clk_RAM_E => clk_RAM_E,
                  clk_RegALU => clk_RegALU,
                  C => C,
                  instruccion => instruccion_interna,
                  funcion => funcion);

end Behavioral;
