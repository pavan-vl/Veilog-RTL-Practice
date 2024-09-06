//Designed by Pavan V L
module beth_piper_sng_tb;
reg clk,rst;
wire bpout;

beth_piper_sng beth_piper_sng_inst(clk,rst,bpout);

initial begin
clk=0;
rst=1;
$monitor(" Output= %0b ",bpout);
#1000 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

endmodule