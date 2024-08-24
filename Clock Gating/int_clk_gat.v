//Designed by Pavan  V L
module int_clk_gat(clk_in,en,out_sig,lat_o); // Integrated Clock Gating using D-Latch
input clk_in,en;
output out_sig,lat_o;

dlat dlat_inst(en,(~clk_in),lat_o); //D Latch Module Instance

assign out_sig= clk_in & lat_o;
endmodule