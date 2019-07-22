	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.numeric_std.all;
 entity UniTraSgnl is 
	port( clk, rst, Ta, Tb : in std_logic;
		  SignalOut	: out std_logic_vector(5 downto 0)
			);
	end UniTraSgnl;

 architecture behave of UniTraSgnl is 
	type state_num is (s0, s1, s2, s3);
	signal CurrentState, NextState : state_num;
	
	begin 
		StateDef: process(clk,rst)
					begin 
						if rst='1' then 
							CurrentState <= s0;
						elsif(rising_edge(clk) or rst = '0') then
							CurrentState<= NextState;
						end if;
					
					end process StateDef;
		StateLogic: process(CurrentState, Ta, Tb)
					begin
						case CurrentState is 
							when s0 => if Ta = '0' then
									NextState <= s1;
										else 
  									NextState <= s0;
										end if;

							 when s1 => NextState <= s2;
							 
							 when s2 => if Tb = '1' then
									NextState <= s3;
								       else
									NextState <= s2;
							 		end if;
							  when s3 =>  NextState <= s0;
							
							 when others => NextState <= s0;
						  end case;
					end process StateLogic;
		
			OutputBlock: process(CurrentState)
						begin 
						  case CurrentState is
							when s0 => SignalOut <= "100001";
							when s1 => SignalOut <= "100010";
							when s2 => SignalOut <= "001100";
							when s3 => SignalOut <= "010100";
    						when others => SignalOut <= "010010";
					   end case;
						end process OutputBlock;						
			end behave;						