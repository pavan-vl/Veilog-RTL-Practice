//Designed by Pavan V L
module beth_piper_sng(clk,rst,bpout); //Beth-Piper Stop-and-Go Generator
input clk,rst;
output [31:0]bpout;

wire [31:0]lf1_o,lf2_o, lf3_o;
wire clk_lf2;

assign clk_lf2 = clk & lf1_o[31];

lfsr_32bit1 lfsr_32bit1_inst(clk,rst,lf1_o);
lfsr_32bit2 lfsr_32bit2_inst(clk_lf2,rst,lf2_o);
lfsr_32bit3 lfsr_32bit3_inst(clk,rst,lf3_o);

assign bpout= lf2_o ^ lf3_o;

endmodule