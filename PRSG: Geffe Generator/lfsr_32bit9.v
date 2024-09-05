//Designed by Pavan V L
module lfsr_32bit9(clk,rst,lout7);
input clk,rst;
output lout7;
reg [31:0]out;

wire fb;
assign fb= out[0]^ out[31] ^ ( out[23] & out[5] | out[7] ) ^ ( ~(out[28] & ( ~(out[17]) ) ) );
always @(posedge clk or posedge rst) begin
if(rst)
out<=32'h6DABABC5;
else 
out<= (out<<1) | fb;
end
assign lout7=out[31];
endmodule