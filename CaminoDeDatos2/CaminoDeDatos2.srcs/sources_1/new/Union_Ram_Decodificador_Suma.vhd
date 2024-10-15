----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 12:11:58
-- Design Name: 
-- Module Name: Union_Ram_Decodificador_Suma - Behavioral
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

entity Union_Ram_Decodificador_Suma is
    Port ( clk_RAM : in STD_LOGIC;
           clk_RegALU : in STD_LOGIC;
           C: in STD_LOGIC_VECTOR (1 downto 0); --Esta entrada simula el controlador de la ALU, como todavia no esta ponemos esta entrada para decidir que operacion hacer
    instruccion : in STD_LOGIC_VECTOR (31 downto 0));
end Union_Ram_Decodificador_Suma;

architecture Behavioral of Union_Ram_Decodificador_Suma is

     component DecodificadorInstrucciones
    Port ( instruccion : in STD_LOGIC_VECTOR (31 downto 0);
           codigoOperacion : out STD_LOGIC_VECTOR (5 downto 0);
           registro1 : out STD_LOGIC_VECTOR (4 downto 0);
           registro2 : out STD_LOGIC_VECTOR (4 downto 0);
           resultado : out STD_LOGIC_VECTOR (4 downto 0);
           shamt : out STD_LOGIC_VECTOR (4 downto 0);
           funcion : out STD_LOGIC_VECTOR (5 downto 0));
    end component;
    
    component ram
        Port ( clk : in STD_LOGIC;
           addr1 : in STD_LOGIC_VECTOR (4 downto 0);
           addr2 : in STD_LOGIC_VECTOR (4 downto 0);
           addr3 : in STD_LOGIC_VECTOR (4 downto 0);
           resultadoOP : in STD_LOGIC_VECTOR (4 downto 0);
           valor1 : out STD_LOGIC_VECTOR (4 downto 0);
           valor2 : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component Alu
       Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
              B : in  STD_LOGIC_VECTOR (4 downto 0);
              C : in  STD_LOGIC_VECTOR (1 downto 0);
              SALIDA : out  STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component RegistroALU
        Port ( clk : in STD_LOGIC;
           valor_entrada : in STD_LOGIC_VECTOR (4 downto 0);
           valor_salida : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    signal cop: std_logic_vector (5 downto  0);
    signal reg1: std_logic_vector (4 downto 0);
    signal reg2: std_logic_vector (4 downto 0);
    signal reg3: std_logic_vector (4 downto 0);
    signal sham: std_logic_vector (4 downto 0);
    signal func: std_logic_vector (5 downto 0);
    signal resultado: std_logic_vector (4 downto 0);
    signal valorALU: std_logic_vector (4 downto 0);
    signal val1: std_logic_vector (4 downto 0);
    signal val2: std_logic_vector (4 downto 0);
begin

   Decodificador: DecodificadorInstrucciones
    port map(
             instruccion => instruccion,
             codigoOperacion => cop,
             registro1 => reg1,
             registro2 => reg2,
             resultado => reg3,
             shamt => sham,
             funcion => func);
             
    
    rm: ram
    port map(clk => clk_RAM,
             addr1 => reg1,
             addr2 => reg2,
             addr3 => reg3,
             resultadoOP => valorALU,
             valor1 => val1,
             valor2 => val2);
             
    ALU1: Alu
    port map(A => val1,
             B => val2,
             C => C,
             SALIDA => resultado);
             
    reg_alu: RegistroALU
    port map(clk => clk_RegALU,
             valor_entrada => resultado,
             valor_salida => valorALU);

    
end Behavioral;
