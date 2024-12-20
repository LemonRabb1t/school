LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decode4to16 IS
PORT (I : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4 bit A in
            En : IN STD_LOGIC ; -- 1 bit A in
O : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));-- 16 bit out
END decode4to16;

ARCHITECTURE Behavior OF decode4to16 IS
    	SIGNAL EnI : STD_LOGIC_VECTOR(4 DOWNTO 0) ;
BEGIN
  EnI <= En & I ;

    	WITH EnI SELECT
   	  O <= "0000000000000001" WHEN "10000", --when 0 in, 1 out
				"0000000000000010" WHEN "10001", --when 1 in, 2 out
				"0000000000000100" WHEN "10010", --when 2 in, 3 out
				"0000000000001000" WHEN "10011", --when 3 in, 4 out
				"0000000000010000" WHEN "10100", --when 4 in, 5 out
				"0000000000100000" WHEN "10101", --when 5 in, 6 out
				"0000000001000000" WHEN "10110", --when 6 in, 7 out
				"0000000010000000" WHEN "10111", --when 7 in, 8 out
				"0000000100000000" WHEN "11000", --when 8 in, 9 out
				"0000000000000000" WHEN OTHERS; -- 
END Behavior ;
