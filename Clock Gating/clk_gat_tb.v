//Designed by Pavan V L
module clk_gat_tb;
reg clk_in,en;
wire out_sig;
wire lat_o;
//clk_gat clk_gat_inst(clk_in,en,out_sig);
int_clk_gat int_clk_gat_inst(clk_in,en,out_sig,lat_o);

initial begin
clk_in=0;
en=0;
$monitor(" Clock= %0b  Enable= %0b  Output= %0b ",clk_in,en,out_sig);
#120 $finish;
end

always #10 clk_in=~clk_in;

initial #15 en=1;

initial #55 en=0;

initial #70 en=1;

endmodule