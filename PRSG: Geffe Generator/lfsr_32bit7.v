//Designed by Pavan V L
module lfsr_32bit7(clk,rst,lout5);
input clk,rst;
output lout5;
reg [31:0]out;

wire fb;
assign fb= out[0]^ out[31] ^ ( out[23] & out[5] | out[7] ) ^ ( ~(out[28] & ( ~(out[17]) ) ) );
always @(posedge clk or posedge rst) begin
if(rst)
out<=32'hFE864BC0;
else 
out<= (out<<1) | fb;
end
assign lout5=out[31];
endmodule