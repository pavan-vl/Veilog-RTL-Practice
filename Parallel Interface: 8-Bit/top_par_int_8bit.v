//Designed by Pavan V L
module top_par_int_8bit(clk,rst,di_o,do_i,w_r); //Top Module for 8-bit Parallel Interface Circuit
input clk,rst,w_r;
inout [7:0]di_o,do_i;

wire [7:0]din_out,tri1_out,tri2_out,dout_out,dir_o;

din_reg din_reg_inst(clk,rst,di_o,din_out);
tris tris_inst(din_out,do_i,w_r);

dout_reg dout_reg_inst(clk,rst,do_i,dout_out);
dir_reg dir_reg_inst(clk & (~w_r),rst,do_i,dir_o);
tris_o tris_o_inst(dout_out,di_o,dir_o);

endmodule