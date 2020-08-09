--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Division.vhf
-- /___/   /\     Timestamp : 03/23/2018 19:50:13
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl "H:/Documents/city college the first semester/spring 2018 semester/CSC 343/labs/lab2/Samuel_Youssef_Lab_02_Source/Division.vhf" -w "H:/Documents/city college the first semester/spring 2018 semester/CSC 343/labs/lab2/Samuel_Youssef_Lab_02_Source/Division.sch"
--Design Name: Division
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Division is
   port ( I_CLK       : in    std_logic; 
          I_Dividend  : in    std_logic_vector (5 downto 0); 
          I_Divisor   : in    std_logic_vector (5 downto 0); 
          I_EN        : in    std_logic; 
          O_Quotient  : out   std_logic_vector (5 downto 0); 
          O_Remainder : out   std_logic_vector (5 downto 0));
end Division;

architecture BEHAVIORAL of Division is
   signal XLXN_1            : std_logic;
   signal XLXN_2            : std_logic;
   signal XLXN_3            : std_logic;
   signal XLXN_4            : std_logic;
   signal XLXN_5            : std_logic;
   signal XLXN_8            : std_logic_vector (5 downto 0);
   signal O_Remainder_DUMMY : std_logic_vector (5 downto 0);
   component ALU
      port ( I_ALU_EN   : in    std_logic; 
             I_ALU_A    : in    std_logic_vector (5 downto 0); 
             I_ALU_B    : in    std_logic_vector (5 downto 0); 
             O_ALU_Flag : out   std_logic; 
             O_ALU_Out  : out   std_logic_vector (5 downto 0));
   end component;
   
   component Control
      port ( I_CTL_CLK : in    std_logic; 
             I_CTL_EN  : in    std_logic; 
             O_CTL_RMD : out   std_logic; 
             O_CTL_SLL : out   std_logic; 
             O_CTL_ALU : out   std_logic; 
             O_CTL_INI : out   std_logic);
   end component;
   
   component DivRegister
      port ( I_REG_Init   : in    std_logic; 
             I_REG_Update : in    std_logic; 
             I_REG_SLL    : in    std_logic; 
             I_REG_LSB    : in    std_logic; 
             I_REG_Div    : in    std_logic_vector (5 downto 0); 
             I_REG_ALU    : in    std_logic_vector (5 downto 0); 
             O_REG_HI     : out   std_logic_vector (5 downto 0); 
             O_REG_LO     : out   std_logic_vector (5 downto 0));
   end component;
   
begin
   O_Remainder(5 downto 0) <= O_Remainder_DUMMY(5 downto 0);
   XLXI_1 : ALU
      port map (I_ALU_A(5 downto 0)=>O_Remainder_DUMMY(5 downto 0),
                I_ALU_B(5 downto 0)=>I_Divisor(5 downto 0),
                I_ALU_EN=>XLXN_4,
                O_ALU_Flag=>XLXN_5,
                O_ALU_Out(5 downto 0)=>XLXN_8(5 downto 0));
   
   XLXI_2 : Control
      port map (I_CTL_CLK=>I_CLK,
                I_CTL_EN=>I_EN,
                O_CTL_ALU=>XLXN_4,
                O_CTL_INI=>XLXN_2,
                O_CTL_RMD=>XLXN_3,
                O_CTL_SLL=>XLXN_1);
   
   XLXI_3 : DivRegister
      port map (I_REG_ALU(5 downto 0)=>XLXN_8(5 downto 0),
                I_REG_Div(5 downto 0)=>I_Dividend(5 downto 0),
                I_REG_Init=>XLXN_2,
                I_REG_LSB=>XLXN_5,
                I_REG_SLL=>XLXN_1,
                I_REG_Update=>XLXN_3,
                O_REG_HI(5 downto 0)=>O_Remainder_DUMMY(5 downto 0),
                O_REG_LO(5 downto 0)=>O_Quotient(5 downto 0));
   
end BEHAVIORAL;


