LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU1 IS 
PORT (Clock : in STD_LOGIC; -- in clock
	A, B : in unsigned(7 DOWNTO 0); -- 8 bit in from A B
	OP : in unsigned(15 DOWNTO 0); -- 16 bit in from decode
	OUT1 : out unsigned(3 DOWNTO 0); -- lower 4 bit/8 bit out
	OUT2 : out unsigned(3 DOWNTO 0); -- higher 4 bit/8 bit out
	Neg : out std_logic); -- dawg yo numba is neg or nah
END ALU1;

ARCHITECTURE calc of ALU1 IS -- temp signal 
SIGNAL Reg1, Reg2, Result : unsigned(7 DOWNTO 0) := (others => '0');
BEGIN
	Reg1 <= A; -- store A in Reg1
	Reg2 <= B; -- store B in Reg2 

PROCESS(Clock, OP)
BEGIN
	IF(rising_edge(Clock)) THEN -- do calc @ pos clock
		CASE OP IS
			WHEN "0000000000000001" => -- Reg1 + Reg2
				Result <= (Reg1 + Reg2);
				Neg <= '0';
			WHEN "0000000000000010" => -- Reg1 - Reg 2, neg bit if need
				Result <= ( Reg1 - Reg2 );
				IF (Reg1 > Reg2) THEN
					Neg <= '0';
				ELSE
					Neg <= '1';
			  end if ;
			WHEN "0000000000000100" => -- inverse
				Result <= (not(Reg1));
				Neg <= '0';
			WHEN "0000000000001000" => -- NAND
				Result <= (Reg1 NAND Reg2);
				Neg <= '0';
			WHEN "0000000000010000" => -- NOR
				Result <= (Reg1 NOR Reg2);
				Neg <= '0';
			WHEN "0000000000100000" => -- AND
				Result <= (Reg1 AND Reg2);
				Neg <= '0';
			WHEN "0000000001000000" => -- OR
				Result <= (Reg1 OR Reg2);
				Neg <= '0';
			WHEN "0000000010000000" => -- XOR
				Result <=(Reg1 XOR Reg2);
				Neg <= '0';
			WHEN "0000000100000000" =>-- XNOR
				Result <= (Reg1 XNOR Reg2);
				Neg <= '0';
				
			WHEN OTHERS =>
				Result <= "00000000";
		END CASE;
	END IF;
END PROCESS;
OUT1 <= Result(3 DOWNTO 0); -- first 4 bit out
OUT2 <= Result(7 DOWNTO 4); -- last 4 bit out

END calc;
