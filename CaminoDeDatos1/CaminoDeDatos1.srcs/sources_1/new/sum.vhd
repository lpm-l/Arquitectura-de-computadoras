----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2024 11:12:02
-- Design Name: 
-- Module Name: sum - Behavioral
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

entity sum is
    Port ( PC_entrada : in STD_LOGIC_VECTOR (3 downto 0);
           rst : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (3 downto 0));
end sum;

architecture Behavioral of sum is
signal contador : std_logic_vector(3 downto 0);

begin

process (PC_entrada,rst)
begin
    contador <= PC_entrada + 1;
end process;

sum_out <= contador;


end Behavioral;
