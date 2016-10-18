------------------------------------------------------------------------------------------------
------	Quartus II RS232 Receiver File
------	for LabExercise 1.3
------	
------	Author Andreas Ciachi
------	e1029176
------	October 2016
------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library altera_mf;
use altera_mf.all;

entity serial_port_receiver is
	generic (
		CLK_DIVISOR		:	integer
	);
	port (
		clk, res_n		:	in		std_logic;
		data				:	in		std_logic;
		empty				:	in		std_logic;
		tx					:	out	std_logic;
		rd					:	out	std_logic
		
	);
end entity serial_port_receiver;

--- EOF ---