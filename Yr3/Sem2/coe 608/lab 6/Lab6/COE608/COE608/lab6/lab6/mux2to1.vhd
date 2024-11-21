LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY mux2to1 IS
PORT (
s : IN std_logic;
w0, w1 : IN STD_LOGIC_VECTOR(31 downto 0);
f : OUT STD_LOGIC_VECTOR(31 downto 0)
);
END mux2to1;

ARCHITECTURE Behavior OF mux2to1 IS
BEGIN
	with s select
		f <= w0 when '0',
			w1 when others;
END Behavior;
