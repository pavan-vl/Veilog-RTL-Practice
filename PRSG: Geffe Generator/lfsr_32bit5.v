//Designed by Pavan V L
module lfsr_32bit5(clk,rst,lout3);
input clk,rst;
output lout3;
reg [31:0]out;

wire fb;
assign fb= out[0]^ out[31] ^ ( out[23] & out[5] | out[7] ) ^ ( ~(out[28] & ( ~(out[17]) ) ) );
always @(posedge clk or posedge rst) begin
if(rst)
out<=32'h8E8DABC2;
else 
out<= (out<<1) | fb;
end
assign lout3=out[31];
endmodule