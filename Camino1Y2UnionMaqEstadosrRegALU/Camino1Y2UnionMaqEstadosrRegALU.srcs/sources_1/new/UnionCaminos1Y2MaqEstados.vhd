----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2024 09:52:38
-- Design Name: 
-- Module Name: UnionCaminos1Y2MaqEstados - Behavioral
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

entity UnionCaminos1Y2MaqEstados is
    Port ( clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            C : in STD_LOGIC_VECTOR (1 downto 0));
end UnionCaminos1Y2MaqEstados;

architecture Behavioral of UnionCaminos1Y2MaqEstados is

component UnionCam1Y2
    Port ( clk_pc : in STD_LOGIC;
           clk_MemInstrucciones : in STD_LOGIC;
           clk_RAM : in STD_LOGIC;
           clk_RegALU : in STD_LOGIC;
           reset : in STD_LOGIC;
           C : in STD_LOGIC_VECTOR (1 downto 0));
end component;

component MaquinaDeEstados
    Port ( clk : in STD_LOGIC;
           edo_1 : out STD_LOGIC;
           edo_2 : out STD_LOGIC;
           edo_3 : out STD_LOGIC;
           edo_4 : out STD_LOGIC;
           reset : in STD_LOGIC);
end component;

signal E1: STD_LOGIC;
signal E2: STD_LOGIC;
signal E3: STD_LOGIC;
signal E4: STD_LOGIC;

begin

    caminos: UnionCam1Y2
    Port map(clk_pc => E1,
             clk_MemInstrucciones => E2,
             clk_RAM => E3,
             clk_RegALU => E4,
              reset => reset,
              C => C  );


    maq: MaquinaDeEstados
    Port map(clk => clk,
             edo_1 => E1,
             edo_2 => E2,
             edo_3 => E3,
             edo_4 => E4,
             reset => reset
                );
end Behavioral;
