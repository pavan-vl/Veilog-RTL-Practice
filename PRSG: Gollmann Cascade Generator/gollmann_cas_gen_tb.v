//Designed by Pavan V L
module gollmann_cas_gen_tb;
reg clk,rst;
wire gcout;

gollmann_cas_gen gollmann_cas_gen_inst(clk,rst,gcout);

initial begin
clk=0;
rst=1;
$monitor(" Time=%0d ns  Output= %0b ",$time,gcout);
#1000 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

endmodule