//Designed by Pavan V L
module fsm_bin_palin_det_tb;
reg ser_in,clk,rst;
wire det;

fsm_bin_palin_det fsm_bin_palin_det_inst(ser_in,clk,rst,det);

initial begin
clk=0;
rst=1;
ser_in=0;
$monitor(" Input=%0b  Reset=%0b  Output=%0b ",ser_in,rst,det);
#230 $finish;
end

always #5 clk=~clk;

initial begin
#20;ser_in=1;
#10;ser_in=0;
#20;ser_in=1;
#30;ser_in=0;
#10;ser_in=1;
#10;ser_in=0;
#20;ser_in=1;
#40;ser_in=0;
#20;ser_in=1;
#10;ser_in=0;
#30;ser_in=1;
end

initial #15 rst=0;

endmodule