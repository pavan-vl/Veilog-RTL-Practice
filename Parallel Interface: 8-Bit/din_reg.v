//Designed by Pavan V L
module din_reg(clk,rst,din,qin);
input clk,rst;
input [7:0]din;
output [7:0]qin;

dff dff_in_1 (clk,rst,din[0],qin[0]);
dff dff_in_2 (clk,rst,din[1],qin[1]);
dff dff_in_3 (clk,rst,din[2],qin[2]);
dff dff_in_4 (clk,rst,din[3],qin[3]);
dff dff_in_5 (clk,rst,din[4],qin[4]);
dff dff_in_6 (clk,rst,din[5],qin[5]);
dff dff_in_7 (clk,rst,din[6],qin[6]);
dff dff_in_8 (clk,rst,din[7],qin[7]);

endmodule