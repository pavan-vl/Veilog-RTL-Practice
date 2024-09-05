//Designed by Pavan V L
module geffe_gen_tb;
reg clk,rst;
wire gefout;

geffe_gen geffe_gen_inst(clk,rst,gefout);

initial begin
clk=0;
rst=1;
$monitor(" Output=%b ",gefout);
#3000 $finish;
end

always #30 clk=~clk;

initial #2 rst=0;

endmodule