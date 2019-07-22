	library ieee;
		use ieee.std_logic_1164.all;
		use ieee.numeric_std.all;
		
 entity UniTraSgnlCountTOP is 
	port( clk_in, rst_in, Ta_in, Tb_in: in std_logic;
		  SignalOut_in	: out std_logic_vector(5 downto 0)
			);
	end UniTraSgnlCountTOP;

 ARCHITECTURE top OF UniTraSgnlCountTOP IS

   COMPONENT  UniTraSgnlCount is 
	PORT( clk, rst, Ta, Tb, ts, tl : IN std_logic;
		  SignalOut	  : OUT std_logic_vector(5 downto 0);
		  Start_Timer : OUT std_logic
			);
	END COMPONENT;
	
	COMPONENT CountFSM IS 
		PORT( ST,Clk : in std_logic;
		  	  TS,TL : out std_logic := '0');
	END COMPONENT;
------------------------------------------------------------------------------------------------------------
 --	signalname_comp1_comp2 Direction from comp1 to comp2
-- signalname_from_comp Signal driving component
-- SgnCtrl -> Traffic Signal Controller
-- count -> counter
-------------------------------------------------------------------------------------------------------------
	SIGNAL ST_SgnCtrl_Count :  std_logic;
	SIGNAL Ts_Count_SgnCtrl: std_logic;
	SIGNAL Tl_Count_SgnCtrl: std_logic;
	
		BEGIN 

		  UniTRAFFICSgnl: ENTITY work.UniTraSgnlCount PORT MAP (clk => clk_in, rst => rst_in, Ta => Ta_in,
	
					Tb => Tb_in, ts=> Ts_Count_SgnCtrl, tl=> Tl_Count_SgnCtrl, SignalOut => SignalOut_in, Start_Timer => ST_SgnCtrl_Count );

		  Counter: ENTITY work.CountFSM PORT MAP (ST => ST_SgnCtrl_Count, Clk => clk_in, TS => Ts_Count_SgnCtrl, 

					TL => Tl_Count_SgnCtrl);
	

--				assert not(SignalOut_in = "100001") report "s0" severity warning;
--				assert not(SignalOut_in = "100010") report "s1" severity warning;
--				assert not(SignalOut_in = "001100") report "s2" severity warning;
--				assert not(SignalOut_in = "010100") report "s2" severity warning;
--				assert not(SignalOut_in = "010010") report "neither state" severity warning;
		END top;
   			

