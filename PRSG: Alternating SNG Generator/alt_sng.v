//Designed by Pavan V L
module alt_sng(clk,rst,altout); // Alternating Stop-and-Go Generator
input clk,rst;
output altout;

wire lf1_o,lf2_o,lf3_o,clk_lf2, clk_lf3;

lfsr_32bit1 lfsr_32bit1_inst(clk,rst,lf1_o);

assign clk_lf2= lf1_o & clk;
assign clk_lf3= (~lf1_o) & clk;

lfsr_32bit2 lfsr_32bit2_inst(clk_lf2,rst,lf2_o);
lfsr_32bit3 lfsr_32bit3_inst(clk_lf3,rst,lf3_o);

assign altout= lf2_o ^ lf3_o;

endmodule