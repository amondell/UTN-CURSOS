----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.06.2021 20:11:57
-- Design Name: Angie Marchena Mondell
-- Module Name: Comp_2bits_Asign - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;


entity Comp_2bit_Asign is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Amayor : out STD_LOGIC;
           Amenor : out STD_LOGIC);
end Comp_2bit_Asign;

architecture rtl of Comp_2bit_Asign is
begin
Comp_2bit_Asign_comparador : process(A,B, Amayor,Amenor)
begin
    if(A(1 downto 0)>B(1 downto 0)) then
        Amenor   <= '1';
        Amayor   <= '0';
    if(A(1 downto 0)<B(1 downto 0)) then
        Amenor   <= '0';
        Amayor   <= '1';
    else
        Amenor   <= '1';
        Amayor   <= '1';
    end if;
    
end process Comp_2bit_Asign_comparador;

end rtl;
