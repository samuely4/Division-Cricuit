--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:22:02 03/03/2018
-- Design Name:   
-- Module Name:   H:/Documents/city college the first semester/spring 2018 semester/CSC 343/project2/testShift.vhd
-- Project Name:  project2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DivRegister
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testShift IS
END testShift;
 
ARCHITECTURE behavior OF testShift IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DivRegister
    PORT(
         I_REG_Init : IN  std_logic;
         I_REG_Update : IN  std_logic;
         I_REG_SLL : IN  std_logic;
         I_REG_LSB : IN  std_logic;
         I_REG_Div : IN  std_logic_vector(5 downto 0);
         I_REG_ALU : IN  std_logic_vector(5 downto 0);
         O_REG_HI : OUT  std_logic_vector(5 downto 0);
         O_REG_LO : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_REG_Init : std_logic := '0';
   signal I_REG_Update : std_logic := '0';
   signal I_REG_SLL : std_logic := '0';
   signal I_REG_LSB : std_logic := '0';
   signal I_REG_Div : std_logic_vector(5 downto 0) ;
   signal I_REG_ALU : std_logic_vector(5 downto 0) ;

 	--Outputs
   signal O_REG_HI : std_logic_vector(5 downto 0);
   signal O_REG_LO : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DivRegister PORT MAP (
          I_REG_Init => I_REG_Init,
          I_REG_Update => I_REG_Update,
          I_REG_SLL => I_REG_SLL,
          I_REG_LSB => I_REG_LSB,
          I_REG_Div => I_REG_Div,
          I_REG_ALU => I_REG_ALU,
          O_REG_HI => O_REG_HI,
          O_REG_LO => O_REG_LO
        );

   stim_proc: process
   begin		
      I_REG_Init <= '1'; I_REG_SLL <= '0'; I_REG_Update <= '0';
		I_REG_ALU <= "111010"; 
		I_REG_Div <= "101011";
		wait for 200 ns;
		I_REG_SLL<= '1';I_REG_Init <= '0';I_REG_Update <= '0';
		wait for 100 ns;
		I_REG_LSB <= '1';
		I_REG_Update <= '1';I_REG_Init <= '0'; I_REG_SLL <= '0';
      wait;
   end process;

END;
