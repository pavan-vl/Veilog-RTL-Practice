module dff_jk(d,clk,rst,q,qb);
input d,clk,rst;
output q,qb;

jkff jkff_inst(d,(~d),clk,rst,q,qb);

endmodule