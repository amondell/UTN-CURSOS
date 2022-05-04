----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2021 16:01:31
-- Design Name: 
-- Module Name: FSM_Final - RTL
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

entity FSM_Final is
    Port ( CLK_IN : in STD_LOGIC;
           nRST_IN : in STD_LOGIC;
           BNT_RST : in STD_LOGIC;
           INST : in STD_LOGIC_VECTOR (2 downto 0);
           nRD_RAM : out STD_LOGIC;
           nWR_RAM : out STD_LOGIC;
           nWR_CONT : out STD_LOGIC;
           nEN_CONT : out STD_LOGIC;
           nWR_IR : out STD_LOGIC;
           nWR_RA : out STD_LOGIC;
           nWR_RB : out STD_LOGIC;
           ALU_SEL : out STD_LOGIC_VECTOR (1 downto 0);
           nWR_RC : out STD_LOGIC;
           nRST_STMACH : out STD_LOGIC;
           nRD_RC : out STD_LOGIC);
end FSM_Final;

architecture RTL of FSM_Final is

-- definicion de los estados

    type state_type is (RESET, CHECK, NOP, JMP, LOAD_A,LOAD_B, ADD, LOAD_A2,LOAD_B2, SUB, LOAD_A3,LOAD_B3, sXOR, LOAD_A4,LOAD_B4, sAND);
    signal state, next_state : state_type;

-- declaracion de las señales para las salidas

    signal i_nRD_RAM : STD_LOGIC;
    signal i_nWR_RAM : STD_LOGIC;
    signal i_nWR_CONT : STD_LOGIC;
    signal i_nEN_CONT : STD_LOGIC;
    signal i_nWR_IR : STD_LOGIC;
    signal i_nWR_RA : STD_LOGIC;
    signal i_nWR_RB : STD_LOGIC;
    signal i_ALU_SEL : STD_LOGIC_VECTOR (1 downto 0);
    signal i_nWR_RC : STD_LOGIC;
    signal i_nRD_RC : STD_LOGIC;
    signal i_nRST_STMACH : STD_LOGIC;

begin

-- proceso de sincronia
SYNC_PROC: process (CLK_IN, nRST_IN)
begin
    if(nRST_IN = '0') then
        state <= RESET;
        nRD_RAM <= '1';
        nWR_RAM <= '0';
        nWR_CONT <= '0';
        nEN_CONT <= '1';
        nWR_IR <= '0';
        nWR_RA <= '0';
        nWR_RB <= '0';
        ALU_SEL <= "00";
        nWR_RC <= '0';
        nRST_STMACH <= '0';
        nRD_RC <= '1';
    elsif(CLK_IN' event and CLK_IN = '1') then
        state <= next_state;
        nRD_RAM <= i_nRD_RAM;
        nWR_RAM <= i_nWR_RAM;
        nWR_CONT <= i_nWR_CONT;
        nEN_CONT <= i_nEN_CONT;
        nWR_IR <= i_nWR_IR;
        nWR_RA <= i_nWR_RA;
        nWR_RB <= i_nWR_RB;
        ALU_SEL <= i_ALU_SEL;
        nWR_RC <= i_nWR_RC;
        nRST_STMACH <= i_nRST_STMACH;
        nRD_RC <= i_nRD_RC;
    end if;   
end process; 

-- proceso de decodificacion

OUTPUT_DECODE: process (state)
    begin 
        case state is
            when RESET =>
                i_nRD_RAM <= '0';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '0';    
            when CHECK =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '1';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '1';
                i_nRD_RC <= '0';          
            when NOP =>
                i_nRD_RAM <= '0';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '0';   
            when JMP =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '1';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '0';            
            when LOAD_A =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '1';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '1';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '0';    
            when LOAD_B =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '1';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '1';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '0';           
            when ADD =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '1';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '1';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';   
            when LOAD_A2 =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '1';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '1';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '0';    
            when LOAD_B2 =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '1';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '1';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '0';  
            when SUB =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';               
            when LOAD_A3 =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';   
            when LOAD_B3 =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';            
            when sXOR =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';    
            when LOAD_A4 =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';                      
            when LOAD_B4 =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';   
            when sAND =>
                i_nRD_RAM <= '1';
                i_nWR_RAM <= '0';
                i_nWR_CONT <= '0';
                i_nEN_CONT <= '1';
                i_nWR_IR <= '0';
                i_nWR_RA <= '0';
                i_nWR_RB <= '0';
                i_ALU_SEL <= "00";
                i_nWR_RC <= '0';
                i_nRST_STMACH <= '0';
                i_nRD_RC <= '1';   
        end case;
    end process;
end RTL;
