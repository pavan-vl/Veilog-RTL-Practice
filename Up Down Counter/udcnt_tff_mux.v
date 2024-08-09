//Designed by Pavan V L
module udcounter(i,u_d,clk,q0,q1,q2,q3);
input i,u_d //Up / Down' control Signal
,clk;
output q0,q1,q2,q3;

wire qb0,qb1,qb2,qb3;

wire clk1,clk2,clk3;


tff tff_inst1(i,clk,q0,qb0);
assign qb0=~q0;
mux21 mux_inst1(q0,qb0,u_d,clk1);

tff tff_inst2(i,clk1,q1,qb1);
assign qb1=~q1;
mux21 mux_inst2(q1,qb1,u_d,clk2);

tff tff_inst3(i,clk2,q2,qb2);
assign qb2=~q2;
mux21 mux_inst3(q2,qb2,u_d,clk3);

tff tff_inst4(i,clk3,q3,qb3);
assign qb3=~q3;

endmodule