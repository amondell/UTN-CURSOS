----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/10/2021 10:29:29 PM
-- Design Name: 
-- Module Name: RAM256x8 - RTL
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

entity RAM256x8 is
    Port ( CLK_HS : in STD_LOGIC;
           nWR : in STD_LOGIC;
           nRD : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (7 downto 0);
           DATA : inout STD_LOGIC_VECTOR (7 downto 0));
end RAM256x8;

architecture RTL of RAM256x8 is

    signal i_RD: std_logic;
    signal i_WR: std_logic;
    signal DOUT: std_logic_vector(7 downto 0);

    COMPONENT coreRAMV2
    PORT (
        a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        clk : IN STD_LOGIC;
        we : IN STD_LOGIC;
        spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    END COMPONENT;

begin
    i_RD <= not(nRD);
    i_WR <= not(nWR);
    DATA <= DOUT when i_RD = '1' else (others =>'Z');

    LARAMPORIP : coreRAMV2
    PORT MAP (
        a => Address,
        d => DATA,
        clk => CLK_HS,
        we => i_WR,
        spo => DOUT
    );

end RTL;
