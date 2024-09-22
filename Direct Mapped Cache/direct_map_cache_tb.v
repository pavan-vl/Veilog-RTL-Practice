//Designed by Pavan V L
module direct_map_cache_tb;
reg [5:0]in_addr;
reg clk,rst,wen,ren;
reg [31:0]wdata_i;
wire hit;
wire [31:0]rdata_o;

direct_map_cache direct_map_cache_inst(clk,rst,in_addr,wdata_i,ren,wen,hit,rdata_o);

initial begin
clk=0;
rst=1;
in_addr=6'd0;
wen=1;
ren=0;
wdata_i=32'hABCD1234;
$monitor(" Read_out-Data=%h  Write-Data=%h  Address of Main Memory=%b  Read=%0b  Write=%0b \n Cache Memory- Tag:%b  Line=%d  Block=%d ",
rdata_o,wdata_i,in_addr,ren,wen, direct_map_cache.tag, direct_map_cache.line, direct_map_cache.offset);

#85 $stop;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin
in_addr= 6'b100111; //Line 3, Block 3
#10;
in_addr= 6'b001110; //Line 1, Block 2
wdata_i= 32'h9876432C;  // Example data to write
#10;
wen=0;
#20;
ren=1;
wdata_i=6'd0;
in_addr=6'b001110;
#10;
in_addr=6'b111111;
#10;
in_addr=6'b100111;
end
endmodule