----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2021 07:42:28 PM
-- Design Name: Angie Marchena Mondell
-- Module Name: Sum_COMP_4bits - RTL
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

entity Sum_COMP_64bits is
    Port ( A : in STD_LOGIC_VECTOR (63 downto 0);
           B : in STD_LOGIC_VECTOR (63 downto 0);
           Cin : in STD_LOGIC;
           Cout_64b : out STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (63 downto 0));
end Sum_COMP_64bits;

architecture RTL of Sum_COMP_64bits is

--Cables internos
--    signal iCarry0: std_logic;
--    signal iCarry1: std_logic;
--    signal iCarry2: std_logic;
    signal iCarry: std_logic_vector(2 downto 0);


--Busco el pinout del dispositivo a usar
    component Sum_COMP_16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           Cout_16b : out STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
begin
    
    Sum_d0: Sum_COMP_16bits
    port map( 
        A => A(15 downto 0),
        B => B(15 downto 0),
        Cin => Cin,
        Cout_16b  => iCarry(0),
        Sum => Sum(15 downto 0)
            );

-- 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
-- 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
-- 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
-- 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63

    Sum_d1: Sum_COMP_16bits
    port map( 
        A => A(31 downto 16),
        B => B(31 downto 16),
        Cin => iCarry(0),
        Cout_16b  => iCarry(1),
        Sum => Sum(31 downto 16)
            );

    Sum_d2: Sum_COMP_16bits
    port map( 
        A => A(47 downto 32),
        B => B(47 downto 32),
        Cin => iCarry(1),
        Cout_16b  => iCarry(2),
        Sum => Sum(47 downto 32)
            );

    Sum_d3: Sum_COMP_16bits
    port map( 
        A => A(63 downto 48),
        B => B(63 downto 48),
        Cin => iCarry(2),
        Cout_16b => Cout_64b,
        Sum => Sum(63 downto 48)
            );

end RTL;