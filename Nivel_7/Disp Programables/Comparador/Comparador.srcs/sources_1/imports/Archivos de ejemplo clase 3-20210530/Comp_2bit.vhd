----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2021 07:27:20 PM
-- Design Name: 
-- Module Name: Comparador 2 bits
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

--References : https://wilaebaelectronica.blogspot.com/2017/07/comparador-de-dos-numeros-de-2-bits.html
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

entity Comp_2bit is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Amayor : out STD_LOGIC;
           Amenor : out STD_LOGIC);
end Comp_2bit;

architecture RTL of Comp_2bit is

    signal i_a1b1: std_logic;
    signal i_a0b0: std_logic;
    signal i_x: std_logic;
    signal i_y: std_logic;

begin

    i_a1b1 <= A(1) xor B(1);
    i_a0b0 <= A(0) xor B(0);
    i_x <= i_a1b1 and i_a0b0;
    i_y <= (B(1) and not(A(1))) or(i_a1b1 and B(0) and not(A(0)));
   
    Amayor <= NOT (i_x or i_y);
    Amenor <= NOT (i_y); 

end RTL;
