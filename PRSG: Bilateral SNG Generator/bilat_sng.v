//Designed by Pavan V L
module bilat_sng(clk,rst,biout); // Bilateral Stop-and-Go Generator
input clk,rst;
output biout;

wire clk_lf1, clk_lf2,interim1,interim2;
wire [31:0] lf1_o, lf2_o;

assign interim1= ~( (~lf2_o[31]) & lf2_o[30] );
assign clk_lf2 = interim1 & clk;

assign interim2= ~(interim1 & ( (~lf1_o[31]) & lf1_o[30] ) );
assign clk_lf1= interim2 & clk;

lfsr_32bit1 lfsr_32bit1_inst(clk_lf1,rst,lf1_o);
lfsr_32bit2 lfsr_32bit2_inst(clk_lf2,rst,lf2_o);



assign biout= lf1_o[0] ^ lf2_o[0];

endmodule
