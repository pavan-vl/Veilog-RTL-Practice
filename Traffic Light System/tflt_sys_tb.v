//Designed by Pavan V L
module tflt_sys_tb;
reg clk,rst;
wire r,y,g;

tflt_sys tflt_sys_inst(clk,rst,r,y,g);

initial begin
clk=0;
rst=1;
$monitor(" Reset= %0b  Red= %0b  Yellow= %0b  Green= %0b ",rst,r,y,g);
#400 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

endmodule