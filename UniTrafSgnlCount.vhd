	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.numeric_std.all;
		
 entity UniTraSgnlCount is 
	port( clk, rst, Ta, Tb, ts, tl : in std_logic;
		  SignalOut	: out std_logic_vector(5 downto 0);
		  Start_Timer: out std_logic
			);
	end UniTraSgnlCount;

 architecture behave of UniTraSgnlCount is 
	type state_num is (s0, s1, s2, s3);
	signal CurrentState, NextState : state_num;
	signal st :  std_logic :='0';

	begin 
		Start_Timer <= st;
		--StateDef:
				--st <= '0'; 
				  process(clk,rst,CurrentState, Ta, Tb, Tl, Ts)
					begin 
						
						if rst='1' then 
							CurrentState <= s0;
							st <= '1';
						elsif(rising_edge(clk) and rst = '0' ) then
							st <= '0';
							CurrentState<= NextState;
						
						end if;
					--end process StateDef;
	--	StateLogic: process(CurrentState, Ta, Tb)
			--		 begin
								
					if(rst = '0') then 
						case CurrentState is 
							when s0 => 
								if ( Ta = '0' and tl = '0' ) then
								   	NextState <= s1;
									
									
								elsif (Ta = '1' or tl = '1') then
									NextState <= s0;
																				
								end if;
										

							 when s1 =>
								if ( Ta = '0' and ts = '1')then					
									NextState <= s1;								
							    else 
							       
									NextState <= s2;
									
								end if;
										 
							 when s2 =>
								 if (Tb = '0' and tl = '0') then										 	
									NextState <= s3;

								elsif (Tb = '1' or tl = '1') then											
									 NextState <= s2;

							 		end if;
							
							  when s3 => if ( Tb = '0' and ts = '1' )then	--							 		
									 	NextState <= s3;
									else 									   
										NextState <= s0; 
 										--st <= '1';
									end if;
									
										
							 when others =>
									NextState <= s0; 
						   end case;
						 
   	           			 else 
							CurrentState <= s0; 
						
					   end if ;
					end process ;
	--StateLogic;
		
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
