LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY register32 IS
PORT (
d : IN STD_LOGIC_VECTOR(31 downto 0) ;
ld : IN STD_LOGIC ;
clr : IN STD_LOGIC ;
clk : IN STD_LOGIC ;
Q : OUT STD_LOGIC_VECTOR(31 downto 0)
);
END register32;

ARCHITECTURE Behavior OF register32 IS
BEGIN
	process (ld, clr, clk)
	begin
		if clr = '1' then
			Q <= (others => '0');
			elsif ((clk'event and clk = '1') and (ld = '1')) then
				Q<= d;
			end if;
	end process;
END Behavior;
