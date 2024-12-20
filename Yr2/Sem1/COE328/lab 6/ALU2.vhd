LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU2 IS 
PORT (Clock : in STD_LOGIC; -- in clock
	A, B : in unsigned(7 DOWNTO 0); -- 8 bit in from A B
	OP : in unsigned(15 DOWNTO 0); -- 16 bit in from decode
	OUT1 : out unsigned(3 DOWNTO 0); -- lower 4 bit/8 bit out
	OUT2 : out unsigned(3 DOWNTO 0); -- higher 4 bit/8 bit out
	Neg : out std_logic); -- dawg yo numba is neg or nah

END ALU2;

ARCHITECTURE calc of ALU2 IS -- temp signal 
	SIGNAL Reg1, Reg2, Result : unsigned(7 DOWNTO 0) := (others => '0');
	SIGNAL Reg4 : unsigned (0 TO 7);
	BEGIN
		Reg1 <= A; -- store A in Reg1
		Reg2 <= B; -- store B in Reg2 

process(Clock,OP)
BEGIN
	IF(rising_edge(Clock)) THEN -- do calc @ pos clock
		CASE OP IS
			WHEN "0000000000000001" => -- swap upper lower of A
				Result <= Reg1(3 downto 0) & Reg1(7 downto 4);
			WHEN "0000000000000010" => -- A OR B
				Result <= (Reg1 OR Reg2);
			WHEN "0000000000000100" => -- B-5
				IF (Reg2 < ("00000101")) THEN
					Neg <= '1';
				ELSE
					Neg <= '0';
				END IF;
				Result <= (Reg2-"00000101"); -- (-5)
				
			WHEN "0000000000001000" => -- invert A
				Result <= not(A);
			WHEN "0000000000010000" => -- invert bit sig A
				Result <= Reg1(0)& Reg1(1)& Reg1(2)& Reg1(3)& Reg1(4)& Reg1(5)& Reg1(6)& Reg1(7);
			WHEN "0000000000100000" => -- max A,b
				if (Reg1 > Reg2) then
                Result <= Reg1;
            else
                Result <= Reg2;
            end if;
            Neg <= '0';
			WHEN "0000000001000000" => -- diff A b
				Result <= Reg1 - Reg2;
            if reg1 > reg2 then
                neg <= '0';
            else
                neg <= '1';
            end if;

			WHEN "0000000010000000" => -- XNOR
				Result <= (Reg1 XNOR Reg2);
				Neg <= '0';
			WHEN "0000000100000000" => -- rotate left
				Result <= ROTATE_LEFT (Reg2, 3);			
				Neg <= '0';
			WHEN OTHERS =>
				Result <= "11111111";
		END CASE;
	END IF;
END PROCESS;
OUT1 <= Result(3 downto 0);
OUT2 <= Result (7 downto 4);
END calc;
