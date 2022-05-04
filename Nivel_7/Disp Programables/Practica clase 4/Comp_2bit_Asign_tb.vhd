
library ieee;
use ieee.std_logic_1164.all;


entity Comp_2bit_Asign_tb is
end Comp_2bit_Asign_tb;

entity Comp_2bit_Asign is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Amayor : out STD_LOGIC;
           Amenor : out STD_LOGIC);
end Comp_2bit_Asign;
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.Comp_2bit_Asign port map (A => A, B => B, Amayor => Amayor, Amenor => Amenor);

    tb1 : process
        constant period: time := 20 ns;
        begin
            A <= "00";
            B <= "00";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 00 - 00" severity error;

            A <= "00";
            B <= "01";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '0'))  -- expected output
            -- error
            report "test failed for input combination 00 - 01" severity error;

            A <= "00";
            B <= "10";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '0'))  -- expected output
            -- error
            report "test failed for input combination 00 - 10" severity error;

            A <= "00";
            B <= "11";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '0'))  -- expected output
            -- error
            report "test failed for input combination 00 - 11" severity error;

            A <= "01";
            B <= "00";
            wait for period;
            assert ((Amayor = '0') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 01 - 00" severity error;


            A <= "01";
            B <= "01";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 01 - 01" severity error;

            A <= "01";
            B <= "10";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '0'))  -- expected output
            -- error
            report "test failed for input combination 01 - 10" severity error;

            A <= "01";
            B <= "11";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '0'))  -- expected output
            -- error 
            report "test failed for input combination 01 - 11" severity error;
            
            A <= "10";
            B <= "00";
            wait for period;
            assert ((Amayor = '0') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 10 - 00" severity error;           

            A <= "10";
            B <= "01";
            wait for period;
            assert ((Amayor = '0') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 10 - 01" severity error;   
 
            A <= "10";
            B <= "10";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 10 - 10" severity error;  
            
               
            A <= "10";
            B <= "11";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '0'))  -- expected output
            -- error 
            report "test failed for input combination 10 - 11" severity error;                   

            A <= "11";
            B <= "00";
            wait for period;
            assert ((Amayor = '0') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 11 - 00" severity error;            

            A <= "11";
            B <= "01";
            wait for period;
            assert ((Amayor = '0') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 11 - 01" severity error;        

            A <= "11";
            B <= "10";
            wait for period;
            assert ((Amayor = '0') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 11 - 10" severity error;          
         
            A <= "11";
            B <= "11";
            wait for period;
            assert ((Amayor = '1') and (Amenor = '1'))  -- expected output
            -- error 
            report "test failed for input combination 11 - 11" severity error;               
            wait; -- indefinitely suspend process
         
        end process;
end tb;
