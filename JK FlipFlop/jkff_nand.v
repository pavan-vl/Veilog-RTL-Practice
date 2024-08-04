//Designed by Pavan V L
module jkff_nand(j,k,clk,q,qb);
input j,k,clk;
output q,qb;

wire j3w,k3w,qw,qbw;

nand3_ip nand3_inst1(j3w,j,clk,qbw);
nand3_ip nand3_inst2(k3w,k,clk,qw);

nand nand_inst1(qw,qbw,j3w);
nand nand_inst2(qbw,qw,k3w);

assign q=qw;
assign qb=qbw;

endmodule