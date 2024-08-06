module srff(s,r,clk,rst,q,qb);
input s,r,clk,rst;
output reg q;
output qb;

always @ (posedge clk) begin
if(rst)
q=0;
else begin
if(s==0 && r==0)
q<=q;
else if (s==1 && r==0)
q<=1;
else if (s==0 && r==1)
q<=0;
else if (s==1 && r==1)
q<=1'bx;
end
end

assign qb=~q;


endmodule