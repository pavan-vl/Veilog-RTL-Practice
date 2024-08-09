//Designed by Pavan V L
module udcnt(i,u_d,rst,clk,q0,q1,q2,q3);
input i,u_d //Up / Down' control Signal
,rst,clk;
output reg q0,q1,q2,q3;
reg [3:0]q;
always @ (posedge clk, posedge rst) begin
if(rst && u_d)
	q=4'b0000;
else if(!(rst) && u_d && i) begin
	q<=q+1'b1;
end
if(rst && !(u_d))
	q=4'b1111;
else if(!(rst) && !(u_d) && i) begin
	q<=q-1'b1;
end
end

always @ * begin
q0=q[0];
q1=q[1];
q2=q[2];
q3=q[3];
end
endmodule