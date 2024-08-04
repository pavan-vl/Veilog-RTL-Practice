//Designed by Pavan V L
module tff_async(t,clk,rst,q,qb);
input t,clk,rst;
output reg q;
output qb;

always @ (posedge clk, negedge rst) begin
if(!rst)
q=0;
else begin
if(t)
q<=~q;
else
q<=q;
end
end
assign qb=~q;

endmodule