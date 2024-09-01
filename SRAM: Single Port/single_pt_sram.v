//Designed by Pavna V L
module single_pt_sram(data_io,w_r,clk,addr);
inout [7:0]data_io; //Data width = 8 bits / 1byte
input w_r // Wite/Read' enable signal
,clk;
input [3:0]addr; // Address width= 4 bits, 16 addresses


reg [7:0]tmpr;
reg [7:0] mem [0:15];




always @ (posedge clk) begin
if(w_r) begin
mem[addr]<=data_io;
end
else begin
tmpr<=mem[addr];
end
end
assign data_io = (w_r)?8'bz:tmpr;
endmodule