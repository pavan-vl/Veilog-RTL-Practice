//Designed by Pavan V L
module edge_detect_tb;
reg sig,clk;
wire out;

edge_detect_pos edge_detect_pos_inst(sig,clk,out);

initial begin
clk=0;
sig=0;
$monitor(" Signal=%b  Output=%b ",sig,out);
#20; sig=1;
#15; sig=0;
#20; sig=1;
end

initial #70 $finish;

always #10 clk=~clk;

endmodule