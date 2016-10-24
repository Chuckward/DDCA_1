# Clock constraints
create_clock -name "System Clock" -period 20.000ns [get_ports {clk}]

#Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

#Automatically calculate clock uncertaty to jitter and other effects
derive_clock_uncertainty