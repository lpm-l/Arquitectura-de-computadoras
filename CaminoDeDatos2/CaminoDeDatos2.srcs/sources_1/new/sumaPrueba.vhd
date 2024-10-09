----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 11:34:18
-- Design Name: 
-- Module Name: sumaPrueba - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumaPrueba is
    Port ( entrada1 : in STD_LOGIC_VECTOR (4 downto 0);
           entrada2 : in STD_LOGIC_VECTOR (4 downto 0);
           suma : out STD_LOGIC_VECTOR (4 downto 0));
end sumaPrueba;

architecture Behavioral of sumaPrueba is

begin

    suma <= entrada1 + entrada2;

end Behavioral;
