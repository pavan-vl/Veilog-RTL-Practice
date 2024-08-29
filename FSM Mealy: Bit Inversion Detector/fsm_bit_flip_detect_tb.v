//Designed by Pavan V L
module fsm_bit_flip_detect_tb;
reg ser_in,clk,rst;
wire det;

fsm_bit_flip_detect fsm_bit_flip_detect_inst(ser_in,clk,rst,det);

initial begin
clk=0;
rst=1;
ser_in=0;
$monitor(" Input=%0b  Reset=%0b  Output=%0b ",ser_in,rst,det);
#120 $finish;
end

always #5 clk=~clk;

initial begin
#30;ser_in=1;
#40;ser_in=0;
#20;ser_in=1;
#10;ser_in=0;
#50;ser_in=1;
end

initial #15 rst=0;

endmodule