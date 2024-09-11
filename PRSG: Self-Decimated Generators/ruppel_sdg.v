//Designed by Pavan V L
module ruppel_sdg(clk_5,clk_10,rst,rupout); // Rueppel’s self-decimated generator.
input clk_5,clk_10,rst;
output rupout;

wire clk_lf,lf_o;

reg dec,clk_lf_reg;

lfsr_32bit1_rup lfsr_32bit1_rup_inst(clk_lf,rst,lf_o);

always @ * begin
	dec<=lf_o;
	case(dec)
		1'b0: clk_lf_reg<=clk_5;
		1'b1: clk_lf_reg<=clk_10;
	endcase
end
assign clk_lf=clk_lf_reg;
assign rupout=lf_o;
endmodule