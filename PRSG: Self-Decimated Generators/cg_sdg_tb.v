//Designed by Pavan V L
module cg_sdg_tb;
reg clk_5,clk_10,rst;
wire cgout;

cg_sdg cg_sdg_inst(clk_5,clk_10,rst,cgout);

initial begin
clk_5=0;
clk_10=0;
rst=1;
$monitor(" Time=%0d ns  Output= %0b ",$time,cgout);
#1000 $finish;
end

always #10 clk_5=~clk_5;
always #5 clk_10=~clk_10;

initial #2 rst=0;

endmodule