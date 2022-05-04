----------------------------------------------------------------------------------
-- Company: UTN
-- Engineer: 
-- 
-- Create Date: 09.08.2021 16:01:11
-- Design Name: Angie Marchena Mondell
-- Module Name: deco7seg - Behavioral
-- Project Name: Decodificador 7 segmentos tb
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
end entity;

--Seleccion del modulo 7 segmentos
architecture arch of dec7seg_tb is

    component dec7seg is
        port (
            a, b, c, d, e, f, g : out std_logic;
            x3, x2, x1, x0 : in std_logic
        );
    end component;

    signal tbVectOut : std_logic_vector (6 downto 0);
    signal tbVectIn : std_logic_vector (3 downto 0);

begin
    -- Entradas y salidas del modulo, entrada y salidas
    -- a,b,c,d,e,f    -> Out
    -- x3, x2, x1, x0 -> In
    unit_unde_test: dec7seg port map (
        a => tbVectOut(6),
        b => tbVectOut(5),
        c => tbVectOut(4),
        d => tbVectOut(3),
        e => tbVectOut(2),
        f => tbVectOut(1),
        g => tbVectOut(0),
        x3 => tbVectIn(3),
        x2 => tbVectIn(2),
        x1 => tbVectIn(1),
        x0 => tbVectIn(0)
    );


    -- Generacion de las señales, con 100 ns por cada combinacion binaria...

    generate_input_signals : process
    begin
        tbVectIn <= "0000"; wait for 100 ns;
        tbVectIn <= "0001"; wait for 100 ns;
        tbVectIn <= "0010"; wait for 100 ns;
        tbVectIn <= "0011"; wait for 100 ns;
        tbVectIn <= "0100"; wait for 100 ns;
        tbVectIn <= "0101"; wait for 100 ns;
        tbVectIn <= "0110"; wait for 100 ns;
        tbVectIn <= "0111"; wait for 100 ns;
        tbVectIn <= "1000"; wait for 100 ns;
        tbVectIn <= "1001"; wait for 100 ns;
        tbVectIn <= "1010"; wait for 100 ns;
        tbVectIn <= "1011"; wait for 100 ns;
        tbVectIn <= "1100"; wait for 100 ns;
        tbVectIn <= "1101"; wait for 100 ns;
        tbVectIn <= "1110"; wait for 100 ns;
        tbVectIn <= "1111"; wait for 100 ns;
        report "Fin de la simulacion!";
        -- Final de la simulacion con los resultados.
        wait;
    end process;

end architecture;