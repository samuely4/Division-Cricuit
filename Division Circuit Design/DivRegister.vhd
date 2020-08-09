----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:28:57 03/03/2018 
-- Design Name: 
-- Module Name:    DivRegister - Behavioral 
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

entity DivRegister is
    Port ( I_REG_Init : in  STD_LOGIC;
           I_REG_Update : in  STD_LOGIC;
           I_REG_SLL : in  STD_LOGIC;
           I_REG_LSB : in  STD_LOGIC;
           I_REG_Div : in  STD_LOGIC_VECTOR (5 downto 0);
           I_REG_ALU : in  STD_LOGIC_VECTOR (5 downto 0);
           O_REG_HI : out  STD_LOGIC_VECTOR (5 downto 0);
           O_REG_LO : out  STD_LOGIC_VECTOR (5 downto 0));
end DivRegister;

architecture Behavioral of DivRegister is
signal HI: std_logic_vector (5 downto 0);
signal LOW: std_logic_vector(5 downto 0);
signal LSB : std_logic;
begin
		
DivisionRegister: process(I_REG_Update, I_REG_Init, I_REG_SLL, I_REG_LSB)
begin
		
		if I_REG_Init = '1' then
			HI <= (others=> '0');
			LOW <= I_REG_Div;
		end if;
			
		if I_REG_SLL = '1' then
			HI(5) <= HI(4);
			HI(4) <= HI(3);
			HI(3) <= HI(2);
			HI(2) <= HI(1);
			HI(1) <= HI(0);
			HI(0) <= LOW(5);
			LOW(5) <= LOW(4);
			LOW(4) <= LOW(3);
			LOW(3) <= LOW(2);
			LOW(2) <= LOW(1); 
			LOW(1) <= LOW(0);
			LOW(0) <= '0';
		end if;
		
		if I_REG_LSB = '1' then
			LSB <= '1';
		else
			LSB <= '0';
		end if;
		
		if I_REG_Update = '1' then
			HI <= I_REG_ALU;
			LOW(0) <= LSB; 
		end if;

end process;

	DivisionChange: process(HI, LOW, LSB)
		begin
		
		O_REG_HI <= HI;
		O_REG_LO <= LOW;
		if LSB = '1' then 
		O_REG_LO(0) <= '1';
		end if;
		
	end process;

end Behavioral;

