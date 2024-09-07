//Designed by Pavan V L
module alt_sng_tb;
reg clk,rst;
wire altout;

alt_sng alt_sng_inst(clk,rst,altout);

initial begin
clk=0;
rst=1;
$monitor(" Output= %0b ",altout);
#1000 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

endmodule