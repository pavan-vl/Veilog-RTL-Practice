//Designed by Pavna V L
module dual_pt_sram(din,wen,ren,clk,addrw,addrr,dout);
//Data width = 8 bits / 1byte
inout [7:0]din;
input wen,ren // Wite,Read enable signal
,clk;
input [3:0]addrw,addrr; // Address width= 4 bits, 16 addresses
output reg [7:0]dout;

reg [7:0] mem [0:15];

always @ (posedge clk) begin
if(wen && ~ren) begin
mem[addrw]<=din;
end
else if(~wen && ren) begin
dout<=mem[addrr];
end
else if (wen && ren) begin
mem[addrw]<=din;
dout<=mem[addrr];
end
end
endmodule