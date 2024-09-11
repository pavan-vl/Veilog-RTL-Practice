//Designed by Pavan V L
module ruppel_sdg_tb;
reg clk_5,clk_10,rst;
wire rupout;

ruppel_sdg ruppel_sdg_inst(clk_5,clk_10,rst,rupout);

initial begin
clk_5=0;
clk_10=0;
rst=1;
$monitor(" Time=%0d ns  Output= %0b ",$time,rupout);
#1000 $finish;
end

always #10 clk_5=~clk_5;
always #5 clk_10=~clk_10;

initial #2 rst=0;

endmodule