//Designed by Pavan V L
module shiftreg_siso(d,rst,clk,q0,q1,q2,q3); 
input d,rst,clk;
output reg q0,q1,q2,q3;

wire qb0,qb1,qb2,qb3;

always @ (posedge clk) begin
if (rst) begin
	q0=0;
	q1=0;
	q2=0;
	q3=0;
end
else begin
	q0<=d;
	q1<=q0;
	q2<=q1;
	q3<=q2;
end
end
assign qb0=~q0;
assign qb1=~q1;
assign qb2=~q2;
assign qb3=~q3;
endmodule
