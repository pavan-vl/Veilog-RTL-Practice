//designed by Pavan V L
module sipo_geffe(ser_in,clk,rst,q);
input ser_in,clk,rst;
output reg [2:0]q;

always @(posedge clk or posedge rst) begin
if(rst) begin
q<=0;
end

else begin
	q<={q[1:0],ser_in};
end
end
endmodule