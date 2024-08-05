module tff_jk(t,clk,rst,q,qb);
input t,clk,rst;
output q,qb;

jkff jkff_inst(t,t,clk,rst,q,qb);

endmodule