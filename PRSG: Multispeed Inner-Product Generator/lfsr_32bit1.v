//Designed by Pavan V L
module lfsr_32bit1(clk,rst,out1);
input clk,rst;
output reg [31:0]out1;

wire fb;
assign fb= out1[0]^ out1[31] ^ ( out1[23] & out1[5] | out1[7] ) ^ ( ~(out1[28] & ( ~(out1[17]) ) ) );
always @(posedge clk or posedge rst) begin
if(rst)
out1<=32'h6E8DABC5;
else 
out1<= (out1<<1) | fb;
end
endmodule