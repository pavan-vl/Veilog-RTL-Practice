//Designed by Pavan V L
module jkff(j,k,clk,rst,q,qb);
input j,k,clk,rst;
output reg q;
output qb;

always @ (posedge clk) begin
if(rst)
q=0;
else begin
if(j==0 && k==0)
q<=q;
else if (j==1 && k==0)
q<=1;
else if (j==0 && k==1)
q<=0;
else if (j==1 && k==1)
q<=~q;
end
end
assign qb=~q;


endmodule