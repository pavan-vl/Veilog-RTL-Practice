//Designed by Pavan V L
module cg_sdg(clk_5,clk_10,rst,cgout); //Chambers’s and Gollmann’s self-decimated generator
input clk_5,clk_10,rst;
output cgout;

wire clk_lf;
wire [31:0]lf_o;

reg dec,clk_lf_reg;

lfsr_32bit1_cg lfsr_32bit1_cg_inst(clk_lf,rst,lf_o);

always @ * begin
	dec<=^lf_o;
	case(dec)
		1'b0: clk_lf_reg<=clk_5;
		1'b1: clk_lf_reg<=clk_10;
	endcase
end
assign clk_lf=clk_lf_reg;
assign cgout=lf_o[31];
endmodule