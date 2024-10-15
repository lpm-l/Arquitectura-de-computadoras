----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2024 10:27:37
-- Design Name: 
-- Module Name: Reloj - Behavioral
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

entity Reloj is
    Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end Reloj;

architecture Behavioral of Reloj is

    signal temporal: std_logic:='0';
    signal contador: integer range 0 to 49:= 0;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if(contador = 49) then
                temporal <= not(temporal);
                contador <= 0;
            else
                contador <= contador + 1;
            end if;
        end if;    
    end process;
    
    clk_out <= temporal;


end Behavioral;
