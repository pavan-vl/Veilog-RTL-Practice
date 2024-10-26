//Designed by Pavan V L
module irri_sys_tb;
reg clk,rst;
reg [7:0]wtr_lvl;
wire ir;

irri_sys irri_sys_inst(clk,rst,wtr_lvl,ir);

initial begin
clk=0;
rst=1;
wtr_lvl=8'd127;
$monitor(" Water-Level= %0d %%  Irrigate= %0b ",(wtr_lvl/255.0)*100,ir);
#32 $finish;
end

always #0.5 clk=~clk;

initial #0.2 rst=0;

initial #20 wtr_lvl=8'd20;

endmodule