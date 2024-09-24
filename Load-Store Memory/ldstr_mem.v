//Designed by Pavan V L
module ldstr_mem(clk,rst,ren,wen,addr,wdata,rdata,mem_en);
input clk,rst,ren,wen;
input [2:0]addr;
input [31:0]wdata;
output reg [31:0]rdata;
output reg mem_en;

reg [31:0]storage[0:7];

always @(posedge clk or posedge rst) begin
if(rst) begin
mem_en<=0;
rdata<=32'd0;
storage[0]<=32'd0;
storage[1]<=32'd0;
storage[2]<=32'd0;
storage[3]<=32'd0;
storage[4]<=32'd0;
storage[5]<=32'd0;
storage[6]<=32'd0;
storage[7]<=32'd0;
end
else begin
if(ren) begin
mem_en<=1;
rdata<=storage[addr];
end
else if(wen) begin
mem_en<=1;
storage[addr]<=wdata;
end
else begin
mem_en<=0;

end
end
end

endmodule