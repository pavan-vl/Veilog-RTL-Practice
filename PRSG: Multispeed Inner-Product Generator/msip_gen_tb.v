//Designed by Pavan V L
module msip_gen_tb;
reg clk,rst;
wire gout;

msip_gen msip_gen_inst(clk,rst,gout);

initial begin
clk=0;
rst=1;
$monitor(" Time=%0d ns  Output= %0b ",$time,gout);
#295 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

endmodule