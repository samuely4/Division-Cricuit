----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:16 03/03/2018 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
    Port ( I_CTL_CLK : in  STD_LOGIC;
           I_CTL_EN : in  STD_LOGIC;
           O_CTL_RMD : out  STD_LOGIC;
           O_CTL_SLL : out  STD_LOGIC;
           O_CTL_ALU : out  STD_LOGIC;
           O_CTL_INI : out  STD_LOGIC);
end Control;

architecture Behavioral of Control is
signal state : divisionState := Intial_State;
signal counter: integer := 0;
begin

Control : process(I_CTL_CLK)
begin
if rising_edge (I_CTL_CLK) then
	if I_CTL_EN = '1' then 
		if counter < 6 then
		   if state = Intial_state then state <= Shift_state; 
			
			elsif state = Shift_state then state <= Calculation_state;
			
			elsif state = Calculation_state then state <= RemainderUPD_state;
			
			elsif state = RemainderUPD_state and (counter < 5)then
			state <= Shift_state; counter <= counter + 1;
			else 
			state <= STOP; 
			end if;
	  end if;
	else
		if state = Intial_state then state <= Intial_state;
		else state <= STOP;
		end if;
	end if;
end if;
end process;

ControlState: process(state)
begin 
if state = Intial_state then
O_CTL_INI <= '1'; O_CTL_SLL <= '0'; O_CTL_ALU <= '0'; O_CTL_RMD <= '0';

elsif state = Shift_state then
O_CTL_INI <= '0'; O_CTL_SLL <= '1'; O_CTL_ALU <= '0'; O_CTL_RMD <= '0';

elsif state = Calculation_state then
O_CTL_INI <= '0'; O_CTL_SLL <= '0'; O_CTL_ALU <= '1'; O_CTL_RMD <= '0';

elsif state = RemainderUPD_state then
O_CTL_INI <= '0'; O_CTL_SLL <= '0'; O_CTL_ALU <= '0'; O_CTL_RMD <= '1';

else
O_CTL_INI <= '0'; O_CTL_SLL <= '0'; O_CTL_ALU <= '0'; O_CTL_RMD <= '0';
end if;


end process;

end Behavioral;

