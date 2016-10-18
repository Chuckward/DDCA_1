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

architecture beh of serial_port_receiver is
	type RECEIVER_STATE_TYPE is (
		STATE_IDLE,
		STATE_START_BIT,
		STATE_GOTO_MIDDLE_OF_START_BIT,
		STATE_WAIT_DATA_BIT,
		STATE_MIDDLE_OF_DATA_BIT,
		STATE_WAIT_STOP_BIT,
		STATE_MIDDLE_OF_STOP_BIT
		);
	
	signal receiver_state, receiver_state_next	:	RECEIVER_STATE_TYPE;
	signal bit_cnt, bit_cnt_next						:	integer range 0 to 8;
	signal clk_cnt, clk_cnt_next						:	integer range 0 to CLK_DIVISOR -1;
	signal rd_next, rx_next								:	std_logic;
	signal receive_data, receive_data_next			:	std_logic_vector(7 downto 0);
begin
	clk_cnt_next <= clk_cnt;
	bit_cnt_next <= bit_cnt;
	
	receiver_next_stage : process(receiver_state, clk_cnt, bit_cnt, empty)
	begin 
	
	end process receiver_next_stage;
	
	receiver_output : process(receiver_state, clk_cnt, bit_cnt, data, receive_data)
	begin
	
	end process receiver_output;
	
	sync : process(clk, res_n)
	begin
		if res_n = '0' then
      receiver_state <= STATE_IDLE;
      clk_cnt <= 0;
      transmit_data <= (others => '0');
      bit_cnt <= 0;
      rx <= '0';
      rd <= '0';
    elsif rising_edge(clk) then
      receiver_state <= receiver_state_next;
      clk_cnt <= clk_cnt_next;
      receive_data <= receive_data_next;
      rx <= rx_next;
      bit_cnt <= bit_cnt_next;
      rd <= rd_next;
    end if;
	end process sync;
end architecture beh;