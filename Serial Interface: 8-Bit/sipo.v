//Designed by Pavan V L
module sipo(d,rst,clk,qout); 
input d,rst,clk;
output [3:0]qout;
reg [3:0]q;

wire qb0,qb1,qb2,qb3;

always @ (posedge clk or posedge rst) begin
if (rst) begin
	q[0]=0;
	q[1]=0;
	q[2]=0;
	q[3]=0;
end
else begin
	q[0]<=d;
	q[1]<=q[0];
	q[2]<=q[1];
	q[3]<=q[2];
end
end
assign qout=q;

assign qb=~q;
endmodule