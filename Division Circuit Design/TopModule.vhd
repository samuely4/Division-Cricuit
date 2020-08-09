-- Vhdl test bench created from schematic H:\Documents\city college the first semester\spring 2018 semester\CSC 343\project2\Division.sch - Sat Mar 03 00:55:57 2018
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY Division_Division_sch_tb IS
END Division_Division_sch_tb;
ARCHITECTURE behavioral OF Division_Division_sch_tb IS 

   COMPONENT Division
   PORT( O_Remainder	:	OUT	STD_LOGIC_VECTOR (5 DOWNTO 0); 
          O_Quotient	:	OUT	STD_LOGIC_VECTOR (5 DOWNTO 0); 
          I_CLK	:	IN	STD_LOGIC; 
          I_EN	:	IN	STD_LOGIC; 
          I_Divisor	:	IN	STD_LOGIC_VECTOR (5 DOWNTO 0); 
          I_Dividend	:	IN	STD_LOGIC_VECTOR (5 DOWNTO 0));
   END COMPONENT;
  
   SIGNAL O_Remainder	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
   SIGNAL O_Quotient	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
   SIGNAL I_CLK	:	STD_LOGIC;
   SIGNAL I_EN	:	STD_LOGIC;
   SIGNAL I_Divisor	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
   SIGNAL I_Dividend	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	constant I_CLK_period: time := 10 ns;
BEGIN

   UUT: Division PORT MAP(
		O_Remainder => O_Remainder, 
		O_Quotient => O_Quotient, 
		I_CLK => I_CLK, 
		I_EN => I_EN, 
		I_Divisor => I_Divisor, 
		I_Dividend => I_Dividend
   );

-- *** Test Bench - User Defined Section ***
	I_CLK_PROCESS : PROCESS
   BEGIN
		I_CLK <= '0'; 
		wait for I_CLK_period / 2;
		I_CLK <= '1';
		wait for I_CLK_period / 2;
   END PROCESS;
	
	stim_process: PROCESS
	BEGIN 
		I_Dividend <= "101011";
		I_Divisor <= "001101";
		I_EN <= '0'; wait for 30 ns;
		I_EN <= '1'; wait for 600 ns;
		I_EN <= '0';
		WAIT; -- will wait forever
      
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
