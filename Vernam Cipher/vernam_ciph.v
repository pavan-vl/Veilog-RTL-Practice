//Deisgned by Pavan V L
module vernam_ciph(pt,clk,rst,ct);
input [7:0]pt;
input clk,rst;
output reg [7:0]ct;

wire [31:0]lf1_o;

lfsr_32bit1 lfsr_32bit1_inst(clk,rst,lf1_o);

wire [7:0]key;
assign key = lf1_o[31:24];

always @ (*) begin
if (rst) begin
ct<=0;
end
else begin
if(pt <= 8'd122 && pt>= 8'd97) begin
ct <= pt^key;
end
else begin
ct<=8'bX;
end
end
end
endmodule
