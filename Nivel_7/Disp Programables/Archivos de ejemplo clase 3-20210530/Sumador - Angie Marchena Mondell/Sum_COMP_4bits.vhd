----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2021 05:42:28 PM
-- Design Name: 
-- Module Name: Sum_COMP_16bits - RTL
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

entity Sum_COMP_4bits is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout_4b : out STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0));
end Sum_COMP_4bits;

architecture RTL of Sum_COMP_4bits is

--Cables internos
--    signal iCarry0: std_logic;
--    signal iCarry1: std_logic;
--    signal iCarry2: std_logic;
    signal iCarry: std_logic_vector(2 downto 0);


--Busco el pinout del dispositivo a usar
    component Sum_Comp_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
    end component;

begin
    
    Sum_b0: Sum_Comp_1bit
    port map( 
        A => A(0),
        B => B(0),
        Cin => Cin,
        Cout => iCarry(0),
        Sum => Sum(0)
            );

    Sum_b1: Sum_Comp_1bit
    port map( 
        A => A(1),
        B => B(1),
        Cin => iCarry(0),
        Cout => iCarry(1),
        Sum => Sum(1)
            );

    Sum_b2: Sum_Comp_1bit
    port map( 
        A => A(2),
        B => B(2),
        Cin => iCarry(1),
        Cout => iCarry(2),
        Sum => Sum(2)
            );

    Sum_b3: Sum_Comp_1bit
    port map( 
        A => A(3),
        B => B(3),
        Cin => iCarry(2),
        Cout => Cout_4b,
        Sum => Sum(3)
            );

end RTL;
