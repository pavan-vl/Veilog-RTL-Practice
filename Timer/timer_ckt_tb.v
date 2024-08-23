//Designed by Pavan V L
module timer_ckt_tb;
reg clk,rst;
reg [3:0]time_dur;
wire out_int;

timer_ckt timer_ckt_inst(time_dur,out_int,rst,clk);

initial begin
clk=0;
rst=1;
$monitor(" Time Duration =%d  Reset=%b  Output=%b ",time_dur,rst,out);
#200 $finish;
end