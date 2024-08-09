//Designed by Pavan V L
//For Synccount
module tff(t,clk,q,qb);
input t,clk;
output reg q;
output qb;

initial q=0;

always @ (posedge clk) begin
if(t)
q<=~q;
else
q<=q;
end
assign qb=~q;

endmodule
