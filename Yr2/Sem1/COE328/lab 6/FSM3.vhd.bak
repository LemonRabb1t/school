library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port(clk,reset:in std_logic;
	current_state,student_id:out std_logic_vector(3 downto 0));
	end FSM;
	
	architecture FSM of FSM is
	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8);
	signal yfsm:state_type;
	begin
	process(clk,reset)
	begin
		if reset = '1' then
		yfsm<=s0;
		elsif(clk'event and clk='1')then
			
			case yfsm is
			when s0 => yfsm <=s1;
			when s1 => yfsm <=s2;
			when s2 => yfsm <=s3;
			when s3 => yfsm <=s4;
			when s4 => yfsm <=s5;
			when s5 => yfsm <=s6;
			when s6 => yfsm <=s7;
			when s7 => yfsm <=s8;
			when s8 => yfsm <=s0;
			when others => yfsm <=s0;
			end case;
			end if;
			end process;
			
	process (yfsm)
	begin
		case yfsm is
			when s0 =>current_state <="0000";
				 student_id<="0101"; -- 5
				 
			when s1=>current_state<="0001";
				 student_id<="0000"; -- 0
				 
			when s2=>current_state<="0010";
				 student_id<="0001"; -- 1
				 
			when s3=>current_state<="0011";
				 student_id<="0001"; -- 1
				 
			when s4=>current_state<="0100";
				 student_id<="0011"; -- 3
				 
			when s5=>current_state<="0101";
				 student_id<="0111"; -- 7
				 
			when s6=>current_state<="0110";
				 student_id<="0110"; -- 6
				 
			when s7=>current_state<="0111";
				 student_id<="0101"; -- 5
				 
			when s8=>current_state<="1000";
				 student_id<="1001"; -- 9
				 	
			when others =>current_state <="1111";
               			 student_id <="1111";

		end case;
	end process;
	end FSM;

