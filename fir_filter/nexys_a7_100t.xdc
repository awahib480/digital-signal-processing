## Nexys A7-100T constraints
## System clock (100 MHz)
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports
{ clk }];
## CPU reset button (active LOW, marked CPU_RESET)
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports
{ cpu_resetn }];
## Onboard PDM MEMS microphone
set_property -dict { PACKAGE_PIN J5 IOSTANDARD LVCMOS33 } [get_ports { m_clk }];
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports { m_data }];
set_property -dict { PACKAGE_PIN F5 IOSTANDARD LVCMOS33 } [get_ports { m_lrsel }];
## Onboard mono audio output jack
set_property -dict { PACKAGE_PIN A11 IOSTANDARD LVCMOS33 } [get_ports { aud_pwm }];
set_property -dict { PACKAGE_PIN D12 IOSTANDARD LVCMOS33 } [get_ports { aud_sd }];
