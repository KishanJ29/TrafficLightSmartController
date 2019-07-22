	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.numeric_std.all;
		
 entity UniTraSgnlCount is 
	port( clk, rst, Ta, Tb, ts, tl : in std_logic;
		  SignalOut	: out std_logic_vector(5 downto 0);
		  st : out std_logic
			);
	end UniTraSgnlCount;

 architecture behave of UniTraSgnlCount is 
	type state_num is (s0, s1, s2, s3);
	signal CurrentState, NextState : state_num;
	

	begin 
		StateDef: process(clk,rst)
					begin 
						if rst='1' then 
							CurrentState <= s0;
							st <= '1';
						elsif(rising_edge(clk) and rst = '0' ) then
							st <= '0';
							CurrentState<= NextState;
							
						end if;
					end process StateDef;

		StateLogic: process(CurrentState, Ta, Tb)
					 begin
						st <= '0';
						case CurrentState is 
							when s0 => if (Ta = '0' and tl /= '1') then
															
											NextState <= s1;
										elsif (Ta = '1' and tl = '1') then
											
											NextState <= s0;
										end if;
										st <= '1';

							 when s1 => if (ts = '1')then
											NextState <= s1;
																					
									    else 
									       
											NextState <= s2;
										end if;
										st <= '1';
							 
							 when s2 => if (Tb = '0' and tl /= '1') then
										 	
											NextState <= s3;
										elsif (Tb = '1' and tl = '1') then
											
											 NextState <= s2;
							 			end if;
							 
							  when s3 => if (ts = '1')then
								 		
									 	NextState <= s0;
									else 
									   
										NextState <= s3; 
									end if;
										
							 when others =>
									NextState <= s0; 
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
-------------------------------------------------------------------------------------------
					--Counter FSM Block
-------------------------------------------------------------------------------------------
--		signal TS, TL, ST, clk : 
--			CounterFSM: process(clk)
--						begin	
--						  
--							
--			end behave;
