------------------------------------------------------------------------------------------------
------	Quartus II Main Project File 
------	Exercise 1
------	
------	Author Andreas Ciachi
------	e1029176
------	October 2016
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library altera_mf;
use altera_mf.all;

entity MAIN is	
	port( clk, res_n, color_change					:	in		std_logic
		--	hsync_n, vsync_n								:	out	std_logic;
		--	red, green, blue								:	out	std_logic_vector(7 downto 0);
		--	den, vga_res_n_out, vga_clk_out			:	out 	std_logic;
		--	seg_data											:	out	std_logic_vector(7 * 2 - 1 downto 0);	-- Attetion! DISPLAY_COUNT
		--	ps2_keyboard_clk								:	inout	std_logic;									-- is at the moment 2! 
		--	ps2_keyboard_data								:	inout	std_logic;									-- no constants declaration in entity
		--	rs232_send										:	out	std_logic;
		--	rs232_recv										:	in		std_logic
			);
end MAIN;

architecture DEFAULT of MAIN is

	constant SYS_CLK_FREQ		:		integer := 25000000;
	
	signal sys_clk		:	std_logic;
	
	component main
		port( clk, res_n, color_change					:	in		std_logic
		);
	end component;
	
	use work.sync_pkg.all;
	
begin
	
end architecture DEFAULT;

--- EOF ---