----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/08/2021 10:17:08 PM
-- Design Name: 
-- Module Name: ALU - RTL
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( IN_A : in STD_LOGIC_VECTOR (7 downto 0);
           IN_B : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           RES : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture RTL of ALU is

begin
    process(IN_A, IN_B, Sel)
    begin
        case(Sel) is
            when "00" => RES <= IN_A + IN_B;
            when "01" => RES <= IN_A - IN_B;
            when "10" => RES <= IN_A xor IN_B;
            when others => RES <= IN_A and IN_B;
        end case;
    end process;

end RTL;
