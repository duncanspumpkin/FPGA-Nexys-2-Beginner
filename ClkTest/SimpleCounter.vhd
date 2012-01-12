----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
	  signal incHigh : STD_LOGIC := '0';
begin

	Led <= counter(29 downto 22);
	
	clk_proc: process(clk, counter)
	  begin
		  if rising_edge(clk) then
			  counter(29 downto 15) <= counter(29 downto 15) + incHigh;
			  
			  incHigh <= counter(0) and counter(1) and counter(2) and
			  counter(3) and counter(4) and counter(5) and counter(6) and
			  counter(7) and counter(8) and counter(9) and counter(10) and
			  counter(11) and counter(12) and counter(13) and counter(14);
			  
			  counter(14 downto 0) <= counter(14 downto 0)+sw(7 downto 0);--This of course is wrong!
		  end if;
	  end process;

end Behavioral;

