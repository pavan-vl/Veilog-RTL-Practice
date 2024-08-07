//Designed by Pavan V L
module tff_sync(t,clk,q,qb);
input t,clk;
output reg q;
output qb;

always @ (posedge clk) begin
if(t)
q<=~q;
else
q<=q;
end
assign qb=~q;

endmodule