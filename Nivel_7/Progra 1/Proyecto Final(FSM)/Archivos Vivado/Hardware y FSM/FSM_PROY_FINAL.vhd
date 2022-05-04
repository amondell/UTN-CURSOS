----------------------------------------------------------------------------------
-- Company: Universidad Tecnica Nacional
-- Engineer: Andrey Sanchez Loaiciga
-- 
-- Create Date: 22.08.2021 16:23:04
-- Design Name: 
-- Module Name: FSM_PROY_FINAL - RTL
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

entity FSM_PROY_FINAL is
    Port ( CLK_IN : in STD_LOGIC;
           BTN_RST : in STD_LOGIC;
           INSTRUCCION : in STD_LOGIC_VECTOR (7 downto 0);
           nRD_RAM : out STD_LOGIC;
           nWR_RAM : out STD_LOGIC;
           nWR_CONT : out STD_LOGIC;
           nEN_CONT : out STD_LOGIC;
           nRST_CONT : out STD_LOGIC;
           nWR_IR : out STD_LOGIC;
           nRST_IR : out STD_LOGIC;
           nWR_RA : out STD_LOGIC;
           nRST_RA : out STD_LOGIC;
           nWR_RB : out STD_LOGIC;
           nRST_RB : out STD_LOGIC;
           ALU_SEL : out STD_LOGIC_VECTOR (1 downto 0);
           nWR_RC : out STD_LOGIC;
           nRD_RC : out STD_LOGIC;
           nRST_RC : out STD_LOGIC);
end FSM_PROY_FINAL;

architecture RTL of FSM_PROY_FINAL is


--Definicion de estados
   type state_type is (RESET, LEO_RAM, CARGO_IR, paso_5, paso_6, paso_7, paso_8, paso_9, paso_10,
   paso_11, paso_12, paso_13, paso_14, paso_15, paso_16, paso_17, paso_18, paso_19, paso_20, paso_21,
   paso_22, paso_23, paso_24, paso_25, paso_26, paso_27, paso_28, paso_29, paso_30, paso_31, paso_32,
   paso_33, paso_34, paso_35, paso_36, paso_37, paso_38, paso_39, paso_40, paso_41, paso_42, paso_43,
   paso_44, paso_45, paso_46, paso_47, paso_48, paso_49, paso_50, paso_51);
signal state, next_state : state_type;

--Declaracion de señales para todas las salidas
        signal i_nRD_RAM : STD_LOGIC;
        signal i_nWR_RAM : STD_LOGIC;
        signal i_nWR_CONT : STD_LOGIC;
        signal i_nEN_CONT : STD_LOGIC;
        signal i_nRST_CONT : STD_LOGIC;
        signal i_nWR_IR : STD_LOGIC;
        signal i_nRST_IR : STD_LOGIC;
        signal i_nWR_RA : STD_LOGIC;
        signal i_nRST_RA : STD_LOGIC;
        signal i_nWR_RB : STD_LOGIC;
        signal i_nRST_RB : STD_LOGIC;
        signal i_ALU_SEL : STD_LOGIC_VECTOR (1 downto 0);
        signal i_nWR_RC : STD_LOGIC;
        signal i_nRD_RC : STD_LOGIC;
        signal i_nRST_RC : STD_LOGIC;
        
begin

    --Proceso de sincronÃ­a sincroniza las salidas y los estados con el reloj
    SYNC_PROC: process (CLK_IN, BTN_RST)
    begin
        if (BTN_RST = '0') then
            state <= RESET;
            nRD_RAM <= '1';
            nWR_RAM <= '1';
            nWR_CONT <= '1';
            nEN_CONT <= '1';
            nRST_CONT <= '0';
            nWR_IR <= '1';
            nRST_IR <= '0';
            nWR_RA <= '1';
            nRST_RA <= '0';
            nWR_RB <= '1';
            nRST_RB <= '0';
            ALU_SEL <= "00";
            nWR_RC <= '1';
            nRD_RC <= '1';
            nRST_RC <= '0';
            
        elsif (CLK_IN'event and CLK_IN = '1') then
            state <= next_state;
            nRD_RAM <= i_nRD_RAM;
            nWR_RAM <= i_nWR_RAM;
            nWR_CONT <= i_nWR_CONT;
            nEN_CONT <=  i_nEN_CONT;
            nRST_CONT <= i_nRST_CONT;
            nWR_IR <= i_nWR_IR;
            nRST_IR <=  i_nRST_IR;
            nWR_RA <= i_nWR_RA;
            nRST_RA <= i_nRST_RA;
            nWR_RB <= i_nWR_RB;
            nRST_RB <=  i_nRST_RB;
            ALU_SEL <=  i_ALU_SEL;
            nWR_RC <= i_nWR_RC;
            nRD_RC <= i_nRD_RC;
            nRST_RC <= i_nRST_RC;
        end if;
    end process;

    --proceso de decodificacion de salidas
    
    OUTPUT_DECODE: process (next_state)
    begin
        case next_state is
            when RESET =>
            i_nRD_RAM <= '1';
            i_nWR_RAM <= '1';
            i_nWR_CONT <= '1';
            i_nEN_CONT <= '1';
            i_nRST_CONT <= '0';
            i_nWR_IR <= '1';
            i_nRST_IR <= '0';
            i_nWR_RA <= '1';
            i_nRST_RA <= '0';
            i_nWR_RB <= '1';
            i_nRST_RB <= '0';
            i_ALU_SEL <= "00";
            i_nWR_RC <= '1';
            i_nRD_RC <= '1';
            i_nRST_RC <= '0';
            
          when LEO_RAM =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '0';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when CARGO_IR =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '0';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_5 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_6 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_7 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_8 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_9 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_10 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_11 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '0';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_12 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_13 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_14 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '0';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_15 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_16 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_17 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '0';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_18 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '0';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_19 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_20 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '0';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_21 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_22 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_23 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_24 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '0';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_25 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_26 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_27 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '0';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_28 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '0';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_29 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_30 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '0';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_31 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "01";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_32 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_33 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_34 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '0';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_35 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_36 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_37 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '0';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_38 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '0';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_39 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_40 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '0';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_41 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "10";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_42 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_43 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_44 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '0';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_45 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_46 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_47 =>
          i_nRD_RAM <= '0';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '0';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_48 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '0';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when paso_49 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_50 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '0';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '0';
          i_nRST_RC <= '1';
          
          when paso_51 =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '0';
          i_nRST_CONT <= '1';
          i_nWR_IR <= '1';
          i_nRST_IR <= '1';
          i_nWR_RA <= '1';
          i_nRST_RA <= '1';
          i_nWR_RB <= '1';
          i_nRST_RB <= '1';
          i_ALU_SEL <= "11";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '1';
          
          when others =>
          i_nRD_RAM <= '1';
          i_nWR_RAM <= '1';
          i_nWR_CONT <= '1';
          i_nEN_CONT <= '1';
          i_nRST_CONT <= '0';
          i_nWR_IR <= '1';
          i_nRST_IR <= '0';
          i_nWR_RA <= '1';
          i_nRST_RA <= '0';
          i_nWR_RB <= '1';
          i_nRST_RB <= '0';
          i_ALU_SEL <= "00";
          i_nWR_RC <= '1';
          i_nRD_RC <= '1';
          i_nRST_RC <= '0';
            
        end case;  
        end process;
        
       --proceso de decodificaciOn de estado siguiente
             NEXT_STATE_DECODE: process (state, BTN_RST, INSTRUCCION)
              begin
                 --declare default state for next_state to avoid latches
                 next_state <= state;  --default is to stay in current state
                 --insert statements to decode next_state
                 --below is a simple example
                 case (state) is
                    
                    when RESET =>
                       if BTN_RST = '1' then
                          next_state <= LEO_RAM;
                       end if;

                     when LEO_RAM =>
                           next_state <= CARGO_IR;
                                 
                    when CARGO_IR =>

                        if INSTRUCCION = ("0000" & x"0") then
                                    next_state <= paso_5;
                           else
                               if INSTRUCCION = ("0000" & x"1") then
                                           next_state <= paso_9;
                                  else 
                                     if INSTRUCCION = ("0000" & x"2") then
                                                 next_state <= paso_12;  
                                       else   
                                          if INSTRUCCION = ("0000" & x"3") then
                                                      next_state <= paso_22;
                                            else 
                                               if INSTRUCCION = ("0000" & x"4") then
                                                           next_state <= paso_32;
                                                else                      
                                                   if INSTRUCCION = ("0010" & x"1") then
                                                               next_state <= paso_42;   
                                                   end if;
                                              end if;
                                         end if;
                                    end if;
                               end if;
                          end if;
                             
                     when paso_5 =>
                              next_state <= paso_6;
        
                     when paso_6 =>
                              next_state <= paso_7;   
                              
                     when paso_7 =>
                              next_state <= paso_8;
                              
                     when paso_8 =>
                               next_state <= LEO_RAM; 
                               
                     when paso_9 =>
                               next_state <= paso_10; 
                               
                     when paso_10 =>
                               next_state <= paso_11;
                               
                     when paso_11 =>
                               next_state <= LEO_RAM; 
                               
                     when paso_12 =>
                                next_state <= paso_13;   
                                
                      when paso_13 =>
                                next_state <= paso_14; 
                                
                     when paso_14 =>
                                next_state <= paso_15;  
                                
                     when paso_15 =>
                                next_state <= paso_16; 
                                
                     when paso_16 =>
                                next_state <= paso_17;  
                                
                      when paso_17 =>
                                next_state <= paso_18;  
                                
                     when paso_18 =>
                                next_state <= paso_19;
                                
                     when paso_19 =>
                                next_state <= paso_20;  
 
                      when paso_20 =>
                                next_state <= paso_21; 
                                
                     when paso_21 =>
                                next_state <= LEO_RAM;
                                
                     when paso_22 =>
                                next_state <= paso_23;  
                                
                      when paso_23 =>
                                 next_state <= paso_24; 
                                 
                     when paso_24 =>
                                 next_state <= paso_25; 
                                 
                      when paso_25 =>
                                 next_state <= paso_26; 
                                 
                     when paso_26 =>
                                 next_state <= paso_27;  
                                 
                     when paso_27 =>
                                 next_state <= paso_28; 
                                 
                      when paso_28 =>
                                 next_state <= paso_29;
                                 
                     when paso_29 =>
                                 next_state <= paso_30; 
                                 
                      when paso_30 =>
                                 next_state <= paso_31; 
                                 
                      when paso_31 =>
                                 next_state <= LEO_RAM; 
                                 
                      when paso_32 =>
                                 next_state <= paso_33;
                                 
                     when paso_33 =>
                                 next_state <= paso_34; 
                                 
                     when paso_34 =>
                                 next_state <= paso_35; 
                                 
                     when paso_35 =>
                                 next_state <= paso_36;   
                                 
                      when paso_36 =>
                                 next_state <= paso_37;  
                                 
                     when paso_37 =>
                                 next_state <= paso_38;   
                                 
                      when paso_38 =>
                                 next_state <= paso_39; 
                                 
                     when paso_39 =>
                                 next_state <= paso_40;  
                                 
                     when paso_40 =>
                                 next_state <= paso_41;  
                                 
                     when paso_41 =>
                                 next_state <= LEO_RAM;  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                     when paso_42 =>
                                  next_state <= paso_43;
                                  
                      when paso_43 =>
                                  next_state <= paso_44;   
                                  
                     when paso_44 =>
                                  next_state <= paso_45; 
                                                                                                 
                     when paso_45 =>
                                  next_state <= paso_46;   
                                  
                     when paso_46 =>
                                  next_state <= paso_47;    
                                  
                     when paso_47 =>
                                  next_state <= paso_48;   
                                  
                     when paso_48 =>
                                  next_state <= paso_49;     
                                  
                      when paso_49 =>
                                 next_state <= paso_50; 
                                 
                     when paso_50 =>
                                 next_state <= paso_51;  
                                 
                     when paso_51 =>
                                 next_state <= LEO_RAM;                                                                                                                                                                                                          
                                          
                    when others =>
                       next_state <= RESET;
                 end case;
              end process;
 
end RTL;
