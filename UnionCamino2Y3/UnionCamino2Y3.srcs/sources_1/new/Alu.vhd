----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2024 09:18:34
-- Design Name: 
-- Module Name: Alu - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           C : in  STD_LOGIC_VECTOR (1 downto 0);
           SALIDA : out  STD_LOGIC_VECTOR (4 downto 0));
end Alu;

architecture Behavioral of Alu is

begin

PROCESS(A,B,C)

		variable A_unsigned : unsigned(4 downto 0);  -- A como unsigned para la suma, and y or
		variable B_unsigned : unsigned(4 downto 0);  -- B como unsigned para la suma, and y or
		variable A_signed : signed(4 downto 0);
		variable B_signed : signed(4 downto 0);      -- B como signed para resta
		variable Resultado_unsigned : unsigned(4 downto 0);  -- Resultado unsigned para suma, and y or
		variable Resultado_signed : signed(4 downto 0);

BEGIN

	 A_unsigned := unsigned(A);
    B_unsigned := unsigned(B);
    A_signed := signed(A);  -- Se agrega un cero a la izquierda
    B_signed := signed(B);  -- Se agrega un cero a la izquierda
	 --Es necesario ponerlos como signed para que la resta pueda hacer la suma
	
	CASE C IS
		WHEN "00"=>
			Resultado_unsigned := (A_unsigned) + (B_unsigned); --Aqui se agrega el cero a la izquierda, porque la salida es de 5 bits
         SALIDA <= std_logic_vector(Resultado_unsigned);
		WHEN "01" =>
			Resultado_signed := A_signed - B_signed;
         SALIDA <= std_logic_vector(Resultado_signed);
		WHEN "10"=>
			Resultado_unsigned := (A_unsigned and B_unsigned);  
         SALIDA <= std_logic_vector(Resultado_unsigned);
		WHEN "11" =>
			Resultado_unsigned := (A_unsigned or B_unsigned);   
         SALIDA <= std_logic_vector(Resultado_unsigned);
		WHEN OTHERS =>
			-- Caso por defecto
         SALIDA <= (others => '0'); 
	END CASE;
	
END PROCESS;

end Behavioral;
