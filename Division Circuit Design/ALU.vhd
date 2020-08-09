----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:25:18 03/03/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;
use work.divisionPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( I_ALU_EN : in  STD_LOGIC;
           I_ALU_A : in  STD_LOGIC_VECTOR (5 downto 0);
           I_ALU_B : in  STD_LOGIC_VECTOR (5 downto 0);
           O_ALU_Out : out  STD_LOGIC_VECTOR (5 downto 0);
           O_ALU_Flag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal COUNT : integer := 0;
begin
ALU: process(I_ALU_EN)
 variable  temp1: unsigned(5 downto 0);
 variable  temp2: unsigned(5 downto 0);
 variable result: unsigned(5 downto 0);
	begin
	if I_ALU_EN = '1' then
		temp1 := unsigned(I_ALU_A);
		temp2 := unsigned(I_ALU_B);
		if temp2 > temp1 then	
			O_ALU_Flag <= '0';
			O_ALU_Out <= STD_LOGIC_VECTOR(temp1);
		else
			O_ALU_Flag <= '1';
			result :=  temp1 - temp2 ;
			O_ALU_Out <= STD_LOGIC_VECTOR(result);
		end if;
	else
		if COUNT = 0 then
		O_ALU_Flag <= '0';
		O_ALU_Out <= (others => '0');
		end if;
		COUNT <= COUNT + 1;
	end if; 
	end process;
end Behavioral;

