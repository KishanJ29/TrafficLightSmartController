 library ieee;
		use ieee.std_logic_1164.all;
		use ieee.numeric_std.all;

entity CountFSM is 
	port( ST,Clk : in std_logic;
		  TS,TL : out std_logic := '0');
end CountFSM;
		
 architecture behave of CountFSM is 
   
 	signal count : integer range 0 to 25;
		begin
	Counter: process(clk)
		begin
			if (ST = '1' )then
				count <= 0;
				TS <= '0';
				TL <= '0';
			elsif(rising_edge(clk))then 
				count <= count + 1;
	 		 end if;
			end process counter;

	 Flags: process(count)
		begin
--		if ( rising_edge(clk)) then	
			if (count < 5)then 
				TS<= '1';
              else  
				TS <= '0';	
     			end if;
			if(count < 15)then	
				TL<= '1';
			   else 
				 TL <= '0';	
				end if;
--		end if;
			end process Flags;
	end behave;	
		
