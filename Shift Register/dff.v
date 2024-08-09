//Designed by Pavan V L
//For Shift Register
module dff(d,clk,q,qb);
input d,clk,rst;
output reg q;
output qb;

initial q=0;

always @ (posedge clk) begin
q<=d;
end

assign qb=~q;

endmodule