//Designed by Pavan V L
module shiftreg_siso(d,clk,q);
input d,clk;
output q;

wire q0,q1,q2,qb0,qb1,qb2,qb;

dff dff_inst1(d,clk,q0,qb0);
dff dff_inst1(q0,clk,q1,qb1);
dff dff_inst1(q1,clk,q2,qb2);
dff dff_inst1(q2,clk,q,qb);

endmodule