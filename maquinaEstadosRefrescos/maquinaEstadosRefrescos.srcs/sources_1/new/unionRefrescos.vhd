----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2024 10:28:37
-- Design Name: 
-- Module Name: unionRefrescos - Behavioral
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

entity unionRefrescos is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           activar_bomba : out STD_LOGIC;
           edo_1 : out STD_LOGIC;
           edo_2 : out STD_LOGIC;
           edo_3 : out STD_LOGIC;
           sensor_vaso : in STD_LOGIC;
           sensor_lleno : in STD_LOGIC);
end unionRefrescos;

architecture Behavioral of unionRefrescos is

    component divisorFrecuencia
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_out : out STD_LOGIC);
    end component;
    
    component Refresos
         Port ( sensor_vaso : in STD_LOGIC;
           rst : in STD_LOGIC;
           activar_bomba : out STD_LOGIC;
           edo_1 : out STD_LOGIC;
           edo_2 : out STD_LOGIC;
           edo_3 : out STD_LOGIC;
           sensor_lleno : in STD_LOGIC;
           clk : in STD_LOGIC);
    end component;
    
    signal relojDividido: std_logic;

begin

    divisor: divisorFrecuencia
       port map(clk => clk,
                rst => rst,
                clk_out => relojDividido);
                
    refresco: Refresos
       port map(clk => relojDividido,
                rst => rst,
                sensor_vaso => sensor_vaso,
                sensor_lleno => sensor_lleno,
                edo_1 => edo_1,
                edo_2 => edo_2,
                edo_3 => edo_3,
                activar_bomba => activar_bomba);


end Behavioral;
