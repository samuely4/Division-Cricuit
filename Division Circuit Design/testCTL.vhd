--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:01:52 03/03/2018
-- Design Name:   
-- Module Name:   H:/Documents/city college the first semester/spring 2018 semester/CSC 343/project2/testCTL.vhd
-- Project Name:  project2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control
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
 
ENTITY testCTL IS
END testCTL;
 
ARCHITECTURE behavior OF testCTL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control
    PORT(
         I_CTL_CLK : IN  std_logic;
         I_CTL_EN : IN  std_logic;
         O_CTL_RMD : OUT  std_logic;
         O_CTL_SLL : OUT  std_logic;
         O_CTL_ALU : OUT  std_logic;
         O_CTL_INI : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I_CTL_CLK : std_logic := '0';
   signal I_CTL_EN : std_logic := '0';

 	--Outputs
   signal O_CTL_RMD : std_logic;
   signal O_CTL_SLL : std_logic;
   signal O_CTL_ALU : std_logic;
   signal O_CTL_INI : std_logic;

   -- Clock period definitions
   constant I_CTL_CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control PORT MAP (
          I_CTL_CLK => I_CTL_CLK,
          I_CTL_EN => I_CTL_EN,
          O_CTL_RMD => O_CTL_RMD,
          O_CTL_SLL => O_CTL_SLL,
          O_CTL_ALU => O_CTL_ALU,
          O_CTL_INI => O_CTL_INI
        );

   -- Clock process definitions
   I_CTL_CLK_process :process
   begin
		I_CTL_CLK <= '0';
		wait for I_CTL_CLK_period/2;
		I_CTL_CLK <= '1';
		wait for I_CTL_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process 
   begin
		I_CTL_EN <= '1';
		wait;
   end process;

END;
