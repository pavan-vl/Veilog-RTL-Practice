//Designed by Pavan V L
module watch_dog_timer_tb;
reg clk,rst,wd_en;
wire rst_o;

watch_dog_timer watch_dog_timer_inst(clk,rst,wd_en,rst_o);

initial begin
clk=0;
rst=1;
wd_en=0;
$monitor(" Time=%0d ns WDT Enable=%b  Reset-Out=%b ",$time,wd_en,rst_o);
#2110 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial #20 wd_en=1;

initial #1075 wd_en=0;
initial #1100 wd_en=1;


endmodule