//Copyright (C)2014-2023 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.8.09 
//Created Time: 2023-05-12 11:31:16
create_clock -name JTAG_9 -period 200 -waveform {0 100} [get_ports {JTAG_9}] -add
create_clock -name hClk -period 20 -waveform {0 10} [get_ports {hClk}] -add
create_generated_clock -name processClk -source [get_ports {hClk}] -master_clock hClk -divide_by 5 -multiply_by 2 [get_nets {processClk}]
set_clock_groups -asynchronous -group [get_clocks {JTAG_9}] -group [get_clocks {hClk}] -group [get_clocks {processClk}]
