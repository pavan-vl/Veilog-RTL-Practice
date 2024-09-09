//Designed by Pavan V L
module msip_gen(clk,rst,gout); //Multispeed Inner Product Generator
input clk,rst;
output gout;

wire clk_lf1;
wire [31:0]lf1_o,lf2_o, res;


clk_div clk_div_inst(clk,clk_lf1); //Clock Speed /10 factor

lfsr_32bit1 lfsr_32bit1_inst(clk_lf1,rst,lf1_o);
lfsr_32bit2 lfsr_32bit2_inst(clk,rst,lf2_o); // 10 times faster Clock

assign res = lf1_o & lf2_o;
assign gout= ^res;

endmodule