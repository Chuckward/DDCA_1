transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Dropbox/2017\ Winter/DDCA/Lab_1/DDCA_1/quartus_de2-115/db {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/quartus_de2-115/db/pll_altpll.v}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/serial_port/src/serial_port_receiver_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/serial_port/src/rs232_controller.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/main.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/textmode_controller_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/synchronizer/src/sync_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/seven_segment_display/src/seven_segment_display_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/serial_port/src/serial_port_transmitter_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/rom/src/rom_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ram/src/dp_ram_1c1r1w_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ps2/src/ps2_transceiver_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ps2/src/ps2_transceiver_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/math/src/math_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/pll/pll.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/serial_port/src/serial_port_receiver.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/ltm/display_controller_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/video_ram_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/video_ram.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/textmode_controller_fsm.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/font_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/cursor_controller_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/cursor_controller.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/synchronizer/src/sync.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/seven_segment_display/src/seven_segment_display.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/serial_port/src/serial_port_transmitter.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/rom/src/rom_sync_1r_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ram/src/ram_pkg.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ram/src/dp_ram_1c1r1w.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ps2_ascii/src/ps2_ascii_struct.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ps2/src/ps2_transceiver.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ps2/src/ps2_keyboard_controller_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/output_logic/src/output_logic_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/ltm/display_controller.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/textmode_controller_1c.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/font_rom_beh.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/rom/src/rom_sync_1r.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ram/src/fifo_1c1r1w_mixed.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ps2_ascii/src/ps2_ascii.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ps2/src/ps2_keyboard_controller.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/output_logic/src/output_logic.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/textmode_controller/src/font_rom.vhd}
vcom -93 -work work {D:/Dropbox/2017 Winter/DDCA/Lab_1/DDCA_1/src/ram/src/fifo_1c1r1w.vhd}

