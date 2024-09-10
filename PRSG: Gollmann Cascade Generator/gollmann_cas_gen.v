//Designed by Pavan V L
module gollmann_cas_gen(clk,rst,gcout); // Gollmann cascade Genrator, 3-stage
input clk,rst;
output gcout;

wire clk_lf2, clk_lf3,int1,int2;
wire [31:0]lf1_o, lf2_o, lf3_o;
 
clk_mod clk_mod_inst1(clk,1'b1,lf1_o[31],int1,clk_lf2);
clk_mod clk_mod_inst2(clk,int1,lf2_o[31],int2,clk_lf3);

lfsr_32bit1 lfsr_32bit1_inst(clk,rst,lf1_o);
lfsr_32bit2 lfsr_32bit2_inst(clk_lf2,rst,lf2_o);
lfsr_32bit3 lfsr_32bit3_inst(clk_lf3,rst,lf3_o);

assign gcout = lf3_o[31] ^ int2;

endmodule

///////////////////
//Clock Modifier
module clk_mod(
input inclk,in_prev,in_ser,
output interim,clk_o
);
	assign interim= in_prev ^ in_ser;
	assign clk_o = interim & inclk;

endmodule