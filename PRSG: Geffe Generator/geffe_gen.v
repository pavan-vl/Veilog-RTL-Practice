//Designed by Pavan V L
module geffe_gen(clk,rst,gefout); //8-bit Geffe generator
input clk,rst;
output gefout;

wire clk_lfsr, lfsr1_out;

clk_div clk_div_inst(clk,clk_lfsr);

wire [7:0]out;

lfsr_32bit lfsr_32bit_lfsr2(clk_lfsr,rst,out[0]);
lfsr_32bit3 lfsr_32bit_lfsr3(clk_lfsr,rst,out[1]);
lfsr_32bit4 lfsr_32bit_lfsr4(clk_lfsr,rst,out[2]);
lfsr_32bit5 lfsr_32bit_lfsr5(clk_lfsr,rst,out[3]);
lfsr_32bit6 lfsr_32bit_lfsr6(clk_lfsr,rst,out[4]);
lfsr_32bit7 lfsr_32bit_lfsr7(clk_lfsr,rst,out[5]);
lfsr_32bit8 lfsr_32bit_lfsr8(clk_lfsr,rst,out[6]);
lfsr_32bit9 lfsr_32bit_lfsr9(clk_lfsr,rst,out[7]);


lfsr_32bit lfsr_32bit_lfsr1(clk,rst,lfsr1_out);

wire [2:0]q;

sipo_geffe sipo_geffe_inst(lfsr1_out,clk,rst,q);

mux81_prsg mux81_prsg_inst(out,gefout,q);

endmodule


