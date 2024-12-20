LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ssegYN IS
    PORT (bcd   : IN STD_LOGIC;
        leds     : OUT STD_LOGIC_VECTOR(0 TO 6));
END ssegYN;

ARCHITECTURE Behavior OF ssegYN IS
BEGIN
    PROCESS (bcd)
    BEGIN

        CASE bcd IS         
            WHEN '0' => leds <= "0010101"; -- N
            WHEN OTHERS => leds <= "0111011"; -- Y
        END CASE;
		  
    END PROCESS;
END BEHAVIOR;
