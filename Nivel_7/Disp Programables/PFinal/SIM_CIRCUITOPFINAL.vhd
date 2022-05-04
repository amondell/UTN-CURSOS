----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/11/2021 09:50:55 PM
-- Design Name: 
-- Module Name: SIM_CIRCUITOPFINAL - Behavioral
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

entity SIM_CIRCUITOPFINAL is
--  Port ( );
end SIM_CIRCUITOPFINAL;

architecture Behavioral of SIM_CIRCUITOPFINAL is
--Constantes
    constant PERIOD_100M : time := 10ns;
        
--Entradas
    signal CLK_100M: std_logic:= '1';
    signal RST: std_logic:= '0';

--Component
    component CircuitoPFinal is
    Port ( CLK_100M : in STD_LOGIC;
           RST : in STD_LOGIC);
    end component;

begin
    
    CLK_process: process
    begin
        CLK_100M <= '1';
        wait for PERIOD_100M/2;
        CLK_100M <= '0';
        wait for PERIOD_100M/2;
    end process;
    
    UUT: CircuitoPFinal
    port map( 
        CLK_100M => CLK_100M,
        RST => RST
    );
    
    Stimulus_Process: process
    begin
        RST <= '1';
        wait for PERIOD_100M*10;
        RST <= '0';
        wait;
    end process;

end Behavioral;
