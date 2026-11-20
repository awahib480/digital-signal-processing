// Debug monitor: place at the bottom of audio_loopback_top
ila_0 internal_logic_analyzer (
.clk (clk), // sample with the 100 MHz system clock
.probe0(m_clk), // generated 2.4 MHz microphone clock
.probe1(m_data) // live 1-bit PDM stream from the microphone
);