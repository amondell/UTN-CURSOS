----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2021 06:23:45 PM
-- Design Name: 
-- Module Name: EJ1_C3_MN - RTL
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

entity EJ1_C3_MN is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Y : out STD_LOGIC;
           Z : out STD_LOGIC);
end EJ1_C3_MN;

architecture RTL of EJ1_C3_MN is

    signal i_AyB: std_logic;--decalaramos un cable interno

begin

    i_AyB <= A and B; -- asignamos el valor a un cable interno

    Y <= i_AyB xor (C and not(D)); --Usamos el cable interno en cada una de las ecuaciones
    
    Z <= i_AyB xnor (not(C) and D);


end RTL;
