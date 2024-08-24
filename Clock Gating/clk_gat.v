//Designed by Pavan V L
module clk_gat(clk_in,en,out_sig); //Clock Gating using simple AND gate and Enable logic
input clk_in,en;
output out_sig;

assign out_sig = en & clk_in;
endmodule