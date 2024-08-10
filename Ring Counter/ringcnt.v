//Designed by Pavan V L
module ringcnt(clk,rst,q0,q1,q2,q3);
input clk,rst;
output reg q0,q1,q2,q3;

always @ (posedge clk) begin
if(rst) begin
	q0<=1;
	q1<=0;
	q2<=0;
	q3<=0;
end
else begin
	q0<=q3;
	q1<=q0;
	q2<=q1;
	q3<=q2;
end
end

endmodule