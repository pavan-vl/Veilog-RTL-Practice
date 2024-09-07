//Designed by Pavan V L
module bilat_sng_tb;
reg clk,rst;
wire biout;

bilat_sng bilat_sng_inst(clk,rst,biout);

initial begin
clk=0;
rst=1;
$monitor(" Time=%0d ns Output= %0b ",$time,biout);
#1000 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

endmodule