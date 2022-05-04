----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2021 09:23:19 PM
-- Design Name: 
-- Module Name: Contador8b - RTL
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

entity Contador8b is
    Port ( CLK_HS : in STD_LOGIC;
           nRST : in STD_LOGIC;
           nLoad : in STD_LOGIC;
           nStep : in STD_LOGIC;
           Count_IN : in STD_LOGIC_VECTOR (7 downto 0);
           Count_OUT : out STD_LOGIC_VECTOR (7 downto 0) );
end Contador8b;

architecture RTL of Contador8b is

    signal iCount: std_logic_vector(7 downto 0);

begin
    process(CLK_HS, nRST)
    begin
        if nRST = '0' then
            iCount <= x"00";
        elsif CLK_HS'event and CLK_HS = '1' then
            if nLoad = '0' then
                iCount <= Count_IN;
            else
                if nStep <= '0' then
                    iCount <= iCount + '1';
                end if;
            end if;
        end if;
    
    end process;

    Count_OUT <= iCount;

end RTL;
