//Designed by Pavan V L
module lfsr_32bit(clk,rst,out);
input clk,rst;
output reg [31:0]out;

wire fb;
assign fb= out[0]^ out[31] ^ ( out[23] & out[5] | out[7] ) ^ ( ~(out[28] & ( ~(out[17]) ) ) );
always @(posedge clk) begin
if(rst)
out<=32'h6E8DABC5;
else 
out<= (out<<1) | fb;
end
endmodule