//Designed by Pavan V L
module rem_sys_tb;
reg clk,rst,set;
reg [31:0]dur;
wire notif;

rem_sys rem_sys_inst(clk,rst,set,dur,notif);

initial begin
clk=0;
rst=1;
dur=32'd0;
set=0;
$monitor("Set Reminder?= %0s(%b)  Duration= %0d  Notification= %0s(%b) ",((set)?"Yes":"No"),set,dur,((notif)?"Alert!":"--"),notif);
#500 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin
#8; set=1;
#12; dur=32'd45;
end

endmodule