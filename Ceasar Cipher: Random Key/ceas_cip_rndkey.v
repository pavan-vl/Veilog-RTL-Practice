//Design by Pavan V L
module ceas_cip_rndkey(pt,clk,rst,ct);
input [7:0]pt;
input clk,rst;
output reg [7:0]ct;

wire [31:0]lf2_o;

lfsr_32bit2 lfsr_32bit2_inst(clk,rst,lf2_o);

wire [4:0]key;
assign key = lf2_o[17:13];

always @ (*) begin
if (rst) begin
ct<=0;
end
else begin
if(pt <= 8'd122 && pt>= 8'd97) begin
ct <= (((pt - 8'd97) + (key % 26)) % 26) + 8'd65;
//ct = (pt+ (key %26)) -32 ;
end
else begin
	ct<=8'bX;
end
end
end
endmodule