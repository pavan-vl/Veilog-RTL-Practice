//Designed by Pavan V L
module lfsr_32bit3(clk,rst,out3);
input clk,rst;
output reg [31:0]out3;

wire fb;
assign fb= out3[0]^ out3[31] ^ ( out3[23] & out3[5] | out3[7] ) ^ ( ~(out3[28] & ( ~(out3[17]) ) ) );
always @(posedge clk or posedge rst) begin
if(rst)
out3<=32'h6E8EABC3;
else 
out3<= (out3<<1) | fb;
end
endmodule