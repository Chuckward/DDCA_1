# ModelSim Script file for Behavorial Simulation Task 2
# Andreas Ciachi e1029176
# October 2016

#compile all modified src files
project compileoutofdate

#start simulation with testbench
vsim work.testbench 

#waveform signals
add wave -format logic -label "clk"			/testbench/MAIN/sys_clk
add wave -format logic -label "reset"		/testbench/MAIN/res_n

add wave -format logic -label "ascii new" 	/testbench/MAIN/ps2_ascii0/new_ascii
add wave -format radix -label "ascii data"	/testbench/MAIN/ps2_ascii0/ascii
add wave -format logic -label "ascii empty"	/testbench/MAIN/output/ascii_empty
add wave -format logic -label "ascii full"	/testbench/MAIN/output/ascii_full
add wave -format logic -label "ascii rd"	/testbench/MAIN/output/ascii_rd

add wave -format logic -label "ps2 data"	/testbench/MAIN/ps2_keyboard_ctrl/ps2_data
add wave -format logic -label "ps2 clk"		/testbench/MAIN/ps2_keyboard_ctrl/ps2_clk
add wave -format logic -label "ps2 new"		/testbench/MAIN/ps2_keyboard_ctrl/new_data
add wave -format logic -label "ps2 scan"	/testbench/MAIN/ps2_scan

add wave -format logic -label "7 seg data"	/testbench/MAIN/seg_data

add wave -format logic -label "textm wr"		/testbench/MAIN/textmode_wr
add wave -format logic -label "textm cmd"		/testbench/MAIN/textmode_instruction
add wave -format logic -label "textm cmd data" 	/testbench/MAIN/textmode_instruction_data
add wave -format logic -label "textm busy"		/testbench/MAIN/textmode_busy

add wave -format logic -label "RS232 tx"	/testbench/MAIN/rs232_tx


#run simulation
run 13100 us
