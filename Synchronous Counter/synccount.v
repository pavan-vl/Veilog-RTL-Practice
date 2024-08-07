module synccount(i, clk,q0,q1,q2,q3);
input i,clk;
output q0,q1,q2,q3;

wire q0b,q1b,q2b,q3b;

tff tff_inst1(i,clk,q0,q0b);
tff tff_inst2(i,q0,q1,q1b);
tff tff_inst3(i,q1,q2,q2b);
tff tff_inst4(i,q2,q3,q3b);

endmodule