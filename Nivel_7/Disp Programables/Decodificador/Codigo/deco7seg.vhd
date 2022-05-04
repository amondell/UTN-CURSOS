----------------------------------------------------------------------------------
-- Company: UTN
-- Engineer: 
-- 
-- Create Date: 09.08.2021 16:01:11
-- Design Name: Angie Marchena Mondell
-- Module Name: deco7seg - Behavioral
-- Project Name: Decodificador 7 segmentos
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
use IEEE.std_logic_1164.all;

entity dec7seg_tb is
    port (
        a, b, c, d, e, f, g : out std_logic;
        x3, x2, x1, x0 : in std_logic
    );
end entity;

architecture arch of dec7seg_tb is
begin

    process (x3, x2, x1, x0)
        variable auxVectOut : std_logic_vector (6 downto 0);
        variable auxVectIn : std_logic_vector (3 downto 0);
    begin

        -- Se carga en el vector auxiliar
        auxVectIn(3) := x3;
        auxVectIn(2) := x2;
        auxVectIn(1) := x1;
        auxVectIn(0) := x0;

        -- Se realiza la comparacion con los valores establecidos 
        -- del decodificador 7 segmentos.
        
        if auxVectIn = "0000" then auxVectOut := "1111110";    -- 0
        elsif auxVectIn = "0001" then auxVectOut := "0110000"; -- 1
        elsif auxVectIn = "0010" then auxVectOut := "1101101"; -- 2
        elsif auxVectIn = "0011" then auxVectOut := "1111001"; -- 3
        elsif auxVectIn = "0100" then auxVectOut := "0110011"; -- 4
        elsif auxVectIn = "0101" then auxVectOut := "1011011"; -- 5
        elsif auxVectIn = "0110" then auxVectOut := "1011111"; -- 6
        elsif auxVectIn = "0111" then auxVectOut := "1110000"; -- 7
        elsif auxVectIn = "1000" then auxVectOut := "1111111"; -- 8
        elsif auxVectIn = "1001" then auxVectOut := "1110011"; -- 9
        elsif auxVectIn = "1010" then auxVectOut := "1110111"; -- A
        elsif auxVectIn = "1011" then auxVectOut := "0011111"; -- b
        elsif auxVectIn = "1100" then auxVectOut := "1001110"; -- C
        elsif auxVectIn = "1101" then auxVectOut := "0111101"; -- d
        elsif auxVectIn = "1110" then auxVectOut := "1001111"; -- E
        elsif auxVectIn = "1111" then auxVectOut := "1000111"; -- F
        else auxVectOut := "0000000";
        end if;

        -- Se asignan los vectores a las salidas.
        a <= auxVectOut(6);
        b <= auxVectOut(5);
        c <= auxVectOut(4);
        d <= auxVectOut(3);
        e <= auxVectOut(2);
        f <= auxVectOut(1);
        g <= auxVectOut(0);

    end process;

end architecture;