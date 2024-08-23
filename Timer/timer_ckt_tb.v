//Designed by Pavan V L
module timer_ckt_tb;
reg clk,stop_sig;
reg [3:0]time_dur;
wire out_int;
wire [3:0]cnt;

timer_ckt timer_ckt_inst(time_dur,out_int,clk,cnt,stop_sig);

initial begin
clk=0;
stop_sig=0;
time_dur=4'd3;
$monitor(" Time Duration= %d  Current Timer Value= %d  Output= %b Stop?(%s)",time_dur,cnt,out_int,((stop_sig)?"Yes":"No"));
#250 $finish;
end

always #5 clk= ~clk;



initial #50 time_dur=4'd5;

initial #175 stop_sig=1;

endmodule
