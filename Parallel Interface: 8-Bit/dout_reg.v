//Designed by Pavan V L
module dout_reg(clk,rst,dout,qout);
input clk,rst;
input [7:0]dout;
output [7:0]qout;

dff dff_out_1 (clk,rst,dout[0],qout[0]);
dff dff_out_2 (clk,rst,dout[1],qout[1]);
dff dff_out_3 (clk,rst,dout[2],qout[2]);
dff dff_out_4 (clk,rst,dout[3],qout[3]);
dff dff_out_5 (clk,rst,dout[4],qout[4]);
dff dff_out_6 (clk,rst,dout[5],qout[5]);
dff dff_out_7 (clk,rst,dout[6],qout[6]);
dff dff_out_8 (clk,rst,dout[7],qout[7]);

endmodule