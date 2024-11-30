//Designed by Pavan V L
module ele_ctrl_tb;
reg clk,rst;
reg [3:0] req;
wire [1:0] curr_flr;
wire moving;

ele_ctrl ele_ctrl_inst(clk,rst,req,curr_flr,moving);
initial begin
clk=0;
rst=1;
req = 4'b0000;
$monitor(" Request= %d  Current Floor= %d  Moving?= %s (%b) ",req,curr_flr,((moving)?"Yes":"No"),moving);
#130 $finish;
end

initial begin
#2 rst = 0;
#10 req = 4'b0010;
#20 req = 4'b0000;
#10 req = 4'b0100;
#20 req = 4'b0000;
#10 req = 4'b1000;
#20 req = 4'b0000;
#10 req = 4'b0001;
#20 req = 4'b0000;
end

always #5 clk=~clk;


endmodule
