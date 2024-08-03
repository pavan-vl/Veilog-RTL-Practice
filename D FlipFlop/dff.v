//Desinged by Pavan V L
module dff(d,clk,rst,q,qb);
input d,clk,rst;
output reg q
output qb;
always @ (posedge clk) begin
