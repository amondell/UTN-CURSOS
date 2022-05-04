----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/11/2021 07:19:13 PM
-- Design Name: 
-- Module Name: CircuitoPFinal - RTL
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

entity CircuitoPFinal is
    Port ( CLK_100M : in STD_LOGIC;
           RST : in STD_LOGIC);
end CircuitoPFinal;

architecture RTL of CircuitoPFinal is

    signal iCLK: std_logic;
    signal i_nRST: std_logic;
    
    signal i_RAM_nWR: std_logic;
    signal i_RAM_nRD: std_logic;
    signal i_RAM_Addr: std_logic_vector(7 downto 0);
    signal i_BUS: std_logic_vector(7 downto 0);
    
    signal i_nRST_STMach: std_logic;
    signal i_nLD_Add_cnt: std_logic;
    signal i_nSTP_Add_cnt: std_logic;
    
    signal i_nWR_RA: std_logic;
    signal i_nWR_RB: std_logic;
    signal i_nWR_RC: std_logic;
    signal i_nRD_RC: std_logic;
    signal iBUS_RA: std_logic_vector(7 downto 0);
    signal iBUS_RB: std_logic_vector(7 downto 0);
    signal iBUS_RC: std_logic_vector(7 downto 0);
    
    signal i_ALU_SEL: std_logic_vector(1 downto 0);
    
    signal i_nWR_RI: std_logic;
    signal i_Instruccion: std_logic_vector(7 downto 0);

--DeclaraciOn de componentes
    component clk_wiz_0
    Port ( clk_out1 : out std_logic;
           reset : in std_logic;
           locked : out std_logic;
           clk_in1 : in std_logic);
    end component;
    
    component RAM256x8 is
    Port ( CLK_HS : in STD_LOGIC;
           nWR : in STD_LOGIC;
           nRD : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (7 downto 0);
           DATA : inout STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component Contador8b is
    Port ( CLK_HS : in STD_LOGIC;
           nRST : in STD_LOGIC;
           nLoad : in STD_LOGIC;
           nStep : in STD_LOGIC;
           Count_IN : in STD_LOGIC_VECTOR (7 downto 0);
           Count_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component Reg8bit is
    Port ( CLK_HS : in STD_LOGIC;
           nRST : in STD_LOGIC;
           nWR_EN : in STD_LOGIC;
           nRD_EN : in STD_LOGIC;
           Data_IN : in STD_LOGIC_VECTOR (7 downto 0);
           Data_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component ALU is
        Port ( IN_A : in STD_LOGIC_VECTOR (7 downto 0);
               IN_B : in STD_LOGIC_VECTOR (7 downto 0);
               Sel : in STD_LOGIC_VECTOR (1 downto 0);
               RES : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

component FSM_PROY_FINAL is
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
end component;

begin

    Sintetizador_Reloj: clk_wiz_0
    port map ( 
        clk_out1 => iCLK,
        reset => RST,
        locked => i_nRST,
        clk_in1 => CLK_100M
    );
    
    RAM_Programa: RAM256x8
    port map(
        CLK_HS => iCLK,
        nWR => i_RAM_nWR,
        nRD => i_RAM_nRD,
        Address => i_RAM_Addr,
        DATA => i_BUS
    );

    RAM_COUNTER: Contador8b
    port map( 
        CLK_HS => iCLK,
        nRST => i_nRST_STMach,
        nLoad => i_nLD_Add_cnt,
        nStep => i_nSTP_Add_cnt,
        Count_IN => i_BUS,
        Count_OUT => i_RAM_Addr
    );
    
    RegistroA: Reg8bit
    port map(
        CLK_HS => iCLK,
        nRST => i_nRST_STMach,
        nWR_EN => i_nWR_RA,
        nRD_EN => '0',
        Data_IN => i_BUS,
        Data_OUT => iBUS_RA
    );

    RegistroB: Reg8bit
    port map(
        CLK_HS => iCLK,
        nRST => i_nRST_STMach,
        nWR_EN => i_nWR_RB,
        nRD_EN => '0',
        Data_IN => i_BUS,
        Data_OUT => iBUS_RB
    );

    Calculus_unit: ALU
    port map(
        IN_A => iBUS_RA,
        IN_B => iBUS_RB,
        Sel => i_ALU_SEL,
        RES => iBUS_RC
    );    

    RegistroC: Reg8bit
    port map(
        CLK_HS => iCLK,
        nRST => i_nRST_STMach,
        nWR_EN => i_nWR_RC,
        nRD_EN => i_nRD_RC,
        Data_IN => iBUS_RC,
        Data_OUT => i_BUS
    );

    RegistroInstr: Reg8bit
    port map(
        CLK_HS => iCLK,
        nRST => i_nRST_STMach,
        nWR_EN => i_nWR_RI,
        nRD_EN => '0',
        Data_IN => i_BUS,
        Data_OUT => i_Instruccion
    );

Maquina_Control: FSM_PROY_FINAL 
    port map (
           CLK_IN => iCLK,
           BTN_RST => i_nRST,
           INSTRUCCION => i_Instruccion,
           nRD_RAM => i_RAM_nRD,
           nWR_RAM => i_RAM_nWR,
           nWR_CONT => i_nLD_Add_cnt,
           nEN_CONT => i_nSTP_Add_cnt,
           nRST_CONT => i_nRST_STMach,
           nWR_IR => i_nWR_RI,
           nRST_IR => i_nRST_STMach,
           nWR_RA => i_nWR_RA,
           nRST_RA => i_nRST_STMach,
           nWR_RB => i_nWR_RB,
           nRST_RB => i_nRST_STMach,
           ALU_SEL => i_ALU_SEL,
           nWR_RC => i_nWR_RC,
           nRD_RC => i_nRD_RC,
           nRST_RC => i_nRST_STMach
            );
end RTL;
