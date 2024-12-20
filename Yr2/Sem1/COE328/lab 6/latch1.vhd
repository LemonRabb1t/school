LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latch1 IS
	PORT (A : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8 bit A in
		Resetn, Clock : IN STD_LOGIC; -- 1 bit in and 1 bit reset in
		Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));-- 8 bit out
END latch1;

ARCHITECTURE Behavior OF latch1 IS
BEGIN
	PROCESS (Resetn, Clock)-- takes reset and clock as in
	BEGIN
		IF Resetn= '0' THEN -- when reset = 0 latch no operate
			Q <= "00000000";
		ELSIF Clock'EVENT AND Clock = '1' THEN
			Q <= A;
		END IF;
	END PROCESS;
END Behavior;
