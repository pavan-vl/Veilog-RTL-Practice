//Designed by Pavan V L
module dff_async(d,clk,rst,q,qb); //Asynchronous Reset
input d,clk,rst;
output reg q;
output qb;

always @ (posedge clk, negedge rst) begin
if(!rst)
q=0;
else
q<=d;
end

assign qb=~q;

endmodule