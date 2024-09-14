//Designed by Pavan V L
module lfsr_32bit2(clk,rst,out2);
input clk,rst;
output reg [31:0]out2;

wire fb;
assign fb= out2[0]^ out2[31] ^ ( out2[23] & out2[5] | out2[7] ) ^ ( ~(out2[28] & ( ~(out2[17]) ) ) );
always @(posedge clk or posedge rst) begin
if(rst)
out2<=32'h6E8DA2C1;
else 
out2<= (out2<<1) | fb;
end
endmodule