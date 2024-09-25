//Designed by Pavan V L
module dir_reg(clk,rst,dir_d,dir_q);
input clk,rst;
input [7:0]dir_d;
output [7:0]dir_q;

dff dff_dir_1 (clk,rst,dir_d[0],dir_q[0]);
dff dff_dir_2 (clk,rst,dir_d[1],dir_q[1]);
dff dff_dir_3 (clk,rst,dir_d[2],dir_q[2]);
dff dff_dir_4 (clk,rst,dir_d[3],dir_q[3]);
dff dff_dir_5 (clk,rst,dir_d[4],dir_q[4]);
dff dff_dir_6 (clk,rst,dir_d[5],dir_q[5]);
dff dff_dir_7 (clk,rst,dir_d[6],dir_q[6]);
dff dff_dir_8 (clk,rst,dir_d[7],dir_q[7]);

endmodule