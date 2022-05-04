----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/08/2021 10:05:41 PM
-- Design Name: 
-- Module Name: Reg8bit - RTL
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

entity Reg8bit is
    Port ( CLK_HS : in STD_LOGIC;
           nRST : in STD_LOGIC;
           nWR_EN : in STD_LOGIC;
           nRD_EN : in STD_LOGIC;
           Data_IN : in STD_LOGIC_VECTOR (7 downto 0);
           Data_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end Reg8bit;

architecture RTL of Reg8bit is

signal iREG: std_logic_vector(7 downto 0);

begin
    process(CLK_HS, nRST)
    begin
        if nRST = '0' then
            iREG <= x"00";
        elsif CLK_HS'event and CLK_HS = '1' then
            if nWR_EN = '0'then
                iREG <= Data_IN;
            end if;
        end if;
    end process;

    Data_OUT <= iREG when nRD_EN = '0' else (others => 'Z');

end RTL;
