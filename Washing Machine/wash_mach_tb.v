//Designed by Pavan V L
module wash_mach_tb;
reg clk,rst,start;
wire [2:0]mode;

wash_mach wash_mach_inst(clk,rst,start,mode);

initial begin
clk=0;
rst=1;
start=0;
$monitor(" Start=%0b  Mode= %s (%d) ",start,
( (mode==3'd0)?"Standby":((mode==3'd1)?"Fill":((mode==3'd2)?"Rinse":((mode==3'd3)?"Wash":((mode==3'd4)?"Spin":"Standby")))) ),mode);
#315 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial #10 start=1;

endmodule