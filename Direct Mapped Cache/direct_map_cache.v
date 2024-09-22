//Designed by Pavan V L
module direct_map_cache(clk,rst,in_addr,wdata_i,ren,wen,hit,rdata_o);
/*
Assuming there are 64 words in main memory, i.e,
16 lines each having 4 words, mapped to a cache of 16 words, 
i.e, 4 lines each having 4 words.

Directly mapped

Thus input-address line will have 6-bits: 
2 tag bits, 2 line bits, 2 offset bits.
*/
input [5:0]in_addr;
input clk,rst,wen,ren;
input [31:0]wdata_i;
output reg hit;
output reg [31:0]rdata_o;

reg [31:0] cache_mem [0:3][0:3];
reg [1:0]tag_bits [0:3];
reg val [0:3]; // To indicate if theres a value in the respective memory location, 
               //also used to initialize and avoid junk value
wire [1:0]tag,offset,line;

assign tag= in_addr[5:4];
assign line= in_addr[3:2];
assign offset= in_addr[1:0];

always @ (posedge clk or posedge rst) begin
if(rst) begin
val[0]<=0;
val[1]<=0;
val[2]<=0;
val[3]<=0;
hit<=0;
rdata_o<=0;
end
else begin
	if(ren) begin
		if(val[line] && (tag_bits[line]==tag)) begin
			hit=1;
			rdata_o<= cache_mem[line][offset];
		end
		else begin
			hit<=0; //Miss condition
			rdata_o<=32'd0;
		end
	end
	if(wen) begin
		cache_mem[line][offset]<= wdata_i;
		tag_bits[line]<=tag;
		val[line]<=1;
	end
end
end
endmodule