//Design by Pavan V L
module vigenere_ciph(pt,clk,rst,ct);
input [7:0]pt;
input clk,rst;
output reg [7:0]ct;

wire [31:0]beth_o;

beth_piper_sng beth_piper_sng_inst(clk,rst,beth_o);

wire [4:0]key;
assign key = beth_o[27:23];

always @ (*) begin
if (rst) begin
ct<=0;
end
else begin
if(pt <= 8'd122 && pt>= 8'd97) begin
ct <= (((pt - 8'd97) + (key % 26)) % 26) + 8'd65;
end
else begin
ct<=8'bX;
end
end
end
endmodule