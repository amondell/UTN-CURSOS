----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2021 07:27:20 PM
-- Design Name: 
-- Module Name: Sum_Comp_1bit - RTL
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

entity Sum_Comp_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
end Sum_Comp_1bit;

architecture RTL of Sum_Comp_1bit is

    signal i_AyB: std_logic;
    signal i_AyC: std_logic;
    signal i_ByC: std_logic;

begin

    i_AyB <= A and B;
    i_AyC <= A and Cin;
    i_ByC <= B and Cin;
    Cout <= i_AyB or i_AyC or i_ByC;    

    Sum <= A xor B xor Cin;

end RTL;
