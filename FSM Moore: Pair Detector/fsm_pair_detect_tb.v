//Designed by Pavan V L
module fsm_pair_detect_tb;
reg ser_in,clk,rst;
wire det;

fsm_pair_detect fsm_pair_detect_inst(ser_in,clk,rst,det);

initial begin
clk=0;
rst=1;
ser_in=0;
$monitor("  Serial Input= %0b  Reset=%0b  Pair Detected? %s(%0b) ",ser_in,rst,((det)?"Yes ":"No "),det);
#215 $finish;
end

initial begin
#30;ser_in=1;
#10;ser_in=0;
#10;ser_in=1;
#30;ser_in=0;
#40;ser_in=1;
#10;ser_in=0;
#10;ser_in=1;
end

always #5 clk=~clk;

initial #15 rst=0;

endmodule