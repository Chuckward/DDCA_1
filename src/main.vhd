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
	port( clk, res_n, color_change					:	in		std_logic;
			hsync_n, vsync_n								:	out	std_logic;
			red, green, blue								:	out	std_logic_vector(7 downto 0);
			den, vga_res_n_out, vga_clk_out			:	out 	std_logic;
			seg_data											:	out	std_logic_vector(7 * 2 - 1 downto 0);	-- Attetion! DISPLAY_COUNT
			ps2_keyboard_clk								:	inout	std_logic;									-- is at the moment 2! 
			ps2_keyboard_data								:	inout	std_logic;									-- no constants declaration in entity
			rs232_send										:	out	std_logic;
			rs232_recv										:	in		std_logic
			);
end MAIN;

architecture DEFAULT of MAIN is

	constant SYS_CLK_FREQ		:		integer := 25000000;
	constant SYNC_STAGES			:		integer := 2;
	constant VGA_MIN_FIFO_DEPTH:		integer := 10;
	constant DISPLAY_COUNT		:		integer := 2;
	constant DATA_WIDTH			:		integer := 8;
	constant SYNC0_RESET_VAL	:		std_logic := '1';
	constant SYNC1_RESET_VAL	:		std_logic := '0';
	constant ROW_COUNT			:		integer := 30;
	constant COLUMN_COUNT		:		integer := 100;
	constant BAUD_RATE			:		integer := 9600;
	
	signal sys_clk							:	std_logic;
	signal sys_res_n_sync				:	std_logic;
	signal color_change_sync			:	std_logic;
	signal color_change_sync_n			:	std_logic;
	signal ascii							:	std_logic_vector(7 downto 0);
	signal ascii_new						:	std_logic;
	signal ascii_rd						:	std_logic;
	signal ps2_scan						:	std_logic_vector(7 downto 0);
	signal ps2_new_data					:	std_logic;
	signal textmode_instruction		:	std_logic_vector(7 downto 0);
	signal textmode_instruction_data	:	std_logic_vector(15 downto 0);
	signal textmode_wr					:	std_logic;
	signal textmode_busy					:	std_logic;
	signal fifo_data_out					:	std_logic_vector(DATA_WIDTH - 1 downto 0);
	signal fifo_empty						:	std_logic;
	signal fifo_full						:	std_logic;
	signal rs232_data						: 	std_logic_vector(DATA_WIDTH -1 downto 0);
	signal rs232_rd						:	std_logic;
	
	component main
		port( 
			clk, res_n, color_change				:	in		std_logic;
			hsync_n, vsync_n							:	out	std_logic;
			red, green, blue							:	out	std_logic;
			den, vga_clk_out, vga_res_n_out		:	out	std_logic;
			seg_data										:	out	std_logic
		);
	end component;
	
	component pll is
		port(
			inclk0			: in	std_logic;
			c0					: out	std_logic
		);
	end component;
	
	use work.sync_pkg.all;
	use work.ram_pkg.all;
	use work.textmode_controller_pkg.all;
	use work.output_logic_pkg.all;
	use work.ps2_keyboard_controller_pkg.all;
	use work.ps2_transceiver_pkg.all;
	use work.ps2_ascii_pkg.all;
	use work.seven_segment_display_pkg.all;
	
begin

	vga_clk_out <= sys_clk;

	pll0:pll
		port map(clk, sys_clk);
	
	sync0: sync
		generic map(SYNC_STAGES, SYNC0_RESET_VAL)
		port map(sys_clk, '1', res_n, sys_res_n_sync);
	
	sync1: sync
		generic map(SYNC_STAGES, SYNC1_RESET_VAL)
		port map(sys_clk, sys_res_n_sync, color_change, color_change_sync);
		
	ps2_keyboard_ctrl:ps2_keyboard_controller
		generic map(SYS_CLK_FREQ, SYNC_STAGES)
		port map(sys_clk, sys_res_n_sync, ps2_keyboard_clk, ps2_keyboard_data, ps2_new_data, ps2_scan);
		
	ps2_ascii0: ps2_ascii
		port map(sys_clk, sys_res_n_sync, ps2_scan, ps2_new_data, ascii, ascii_new);
		
	fifo : fifo_1c1r1w
		generic map(VGA_MIN_FIFO_DEPTH, DATA_WIDTH)
		port map(sys_clk, sys_res_n_sync, fifo_data_out, ascii_rd, ascii, ascii_new, fifo_empty, fifo_full);
		    	
	output : output_logic
		port map(sys_clk, sys_res_n_sync, fifo_data_out, ascii_rd, fifo_full, fifo_empty, 
		rs232_data, rs232_rd, '0', '1', color_change_sync, 
		textmode_instruction, textmode_instruction_data, textmode_busy, textmode_wr);
	
	textm_ctrl : textmode_controller_1c
		generic map(ROW_COUNT, COLUMN_COUNT, SYS_CLK_FREQ)
		port map(sys_clk, sys_res_n_sync, textmode_wr, textmode_busy, textmode_instruction, textmode_instruction_data,  
					hsync_n, vsync_n, den, red, green, blue, vga_res_n_out);
	
	seven_segm_display : seven_segment_display
		generic map(SYS_CLK_FREQ, DISPLAY_COUNT)
		port map(sys_clk, sys_res_n_sync, ascii, ascii_new, seg_data);
	
end architecture DEFAULT;

--- EOF ---