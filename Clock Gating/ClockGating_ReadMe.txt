Clock gating is used to control when the clock signal is fed to a particular circuit to reduce dynamic power consumption when there are operations to be performed by the circuit.
1.Simple clock gating - Employs use of AND gate with Enable and clock as its inputs. This implementation causes "clock chopping" where only a part of the clock is passed rather than the entire clock pulse, 
as demonstrated in clk_gate_waveform.png waveform image.

2. Integrated Clok gating - Employs the use of a D-Latch (Enable is fed to D input of latch, Clock is inverted and fed to enable of latch). The ouput of the latch and original clock signal aare fed as inputs to AND gate, 
the providing gated clock output. The dlatch is triggered when original clk is logic 'low'. This avoid "clock chopping", as demonstrated in int_clk_gat_waveform.pg image.
