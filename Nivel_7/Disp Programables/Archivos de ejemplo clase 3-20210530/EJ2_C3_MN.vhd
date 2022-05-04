----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2021 06:38:58 PM
-- Design Name: 
-- Module Name: EJ2_C3_MN - RTO
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

entity EJ2_C3_MN is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           --Y : inout STD_LOGIC; Descripicion erronea uso de un buffer inout innecesario
           Y : out STD_LOGIC;
           Z : out STD_LOGIC);
end EJ2_C3_MN;

architecture RTL of EJ2_C3_MN is

    signal i_AyB: std_logic;

begin

    i_AyB <= A and B;
    
    Y <= i_AyB;
    
    Z <= i_AyB xor C;

    --Y <= A and B; Descripicion erronea uso de un buffer inout innecesario
    --Z <= Y xor C;

end RTL;
