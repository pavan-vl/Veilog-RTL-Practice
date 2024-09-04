//Designed by Pavan V L
module lfsr(clk,rst,out);
input clk,rst;
output reg [3:0]out;

wire fb;
assign fb= out[0]^out[3];
always @(posedge clk) begin
if(rst)
out<=4'b0111;
else 
out<= (out<<1) | fb;
end
endmodule