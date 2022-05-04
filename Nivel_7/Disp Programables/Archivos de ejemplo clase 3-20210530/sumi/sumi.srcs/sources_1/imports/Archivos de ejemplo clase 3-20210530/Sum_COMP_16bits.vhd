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

entity Sum_COMP_16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           Cout_16b : out STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (15 downto 0));
end Sum_COMP_16bits;

architecture RTL of Sum_COMP_16bits is

--Cables internos
--    signal iCarry0: std_logic;
--    signal iCarry1: std_logic;
--    signal iCarry2: std_logic;
    signal iCarry: std_logic_vector(2 downto 0);


--Busco el pinout del dispositivo a usar
    component Sum_COMP_4bits is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout_4b : out STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
begin
    
    Sum_c0: Sum_COMP_4bits
    port map( 
        A => A(3 downto 0),
        B => B(3 downto 0),
        Cin => Cin,
        Cout_4b => iCarry(0),
        Sum => Sum(3 downto 0)
            );
-- 0 1 2 3- 4 5 6 7 -8 9 10 11 -12 13 14 15

    Sum_c1: Sum_COMP_4bits
    port map( 
        A => A(7 downto 4),
        B => B(7 downto 4),
        Cin => iCarry(0),
        Cout_4b => iCarry(1),
        Sum => Sum(7 downto 4)
            );

    Sum_c2: Sum_COMP_4bits
    port map( 
        A => A(11 downto 8),
        B => B(11 downto 8),
        Cin => iCarry(1),
        Cout_4b => iCarry(2),
        Sum => Sum(11 downto 8)
            );

    Sum_c3: Sum_COMP_4bits
    port map( 
        A => A(15 downto 12),
        B => B(15 downto 12),
        Cin => iCarry(2),
        Cout_4b => Cout_16b,
        Sum => Sum(15 downto 12)
            );

end RTL;