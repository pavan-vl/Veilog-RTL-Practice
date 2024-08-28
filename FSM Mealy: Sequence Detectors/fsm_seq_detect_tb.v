//Designed by Pavan V L
module fsm_seq_detect;
reg ser_in,clk,rst;
wire out;

//fsm_seq_detect_overlap fsm_seq_detect_overlap_inst(ser_in,clk,rst,out);
fsm_seq_detect_non_overlap fsm_seq_detect_non_overlap_inst(ser_in,clk,rst,out);
initial begin
clk=0;
rst=1;
ser_in=0;
$monitor(" Input=%0b  Reset=%0b  Output=%0b ",ser_in,rst,out);
#210 $finish;
end

always #5 clk=~clk;

initial begin
#30;ser_in=1;
#10;ser_in=0;
#20;ser_in=1;
#10;ser_in=0;
#20;ser_in=1;
#10;ser_in=0;
#20;ser_in=1;
#10;ser_in=0;
#30;ser_in=1;
#10;ser_in=0;
#20;ser_in=1;
#10;ser_in=0;
end

initial #15 rst=0;

endmodule