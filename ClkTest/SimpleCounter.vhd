----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Duncan Frost
-- 
-- Create Date:    10:52:14 01/08/2012 
-- Design Name: 
-- Module Name:    SimpleCounter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SimpleCounter is
    Port ( sw : in  STD_LOGIC_VECTOR (7 downto 0);
           Led : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC);
end SimpleCounter;

architecture Behavioral of SimpleCounter is
     signal counter : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
begin
	
	--Led output
	Led <= counter(29 downto 22);
	
	clk_proc: process(clk, counter)
	  begin
		  if rising_edge(clk) then  
			  --Increments the counter related to the number of switches used
			  counter(29 downto 0) <= counter(29 downto 0)+sw(7 downto 0);
		  end if;
	  end process;

end Behavioral;

