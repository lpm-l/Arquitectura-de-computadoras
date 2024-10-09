----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2024 10:08:23
-- Design Name: 
-- Module Name: divisorFrecuencia - Behavioral
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

entity divisorFrecuencia is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end divisorFrecuencia;

architecture Behavioral of divisorFrecuencia is
    signal temporal: std_logic:='0';
    signal contador: integer range 0 to 49999999:= 0;
begin

    process(rst, clk)
    begin
        if(rst = '1') then
            temporal <= '0';
            contador <= 0;
        elsif rising_edge(clk) then
            if(contador = 49999999) then
                temporal <= not(temporal);
                contador <= 0;
            else
                contador <= contador + 1;
            end if;
        end if;    
    end process;
    
    clk_out <= temporal;

end Behavioral;
