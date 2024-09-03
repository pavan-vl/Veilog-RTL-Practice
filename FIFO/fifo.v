//Designed by Pavan V L
module fifo(din,clk,rst,wen,ren,full,emp,dout);
input [7:0]din;
input clk,wen,ren,rst;
output reg full,emp;
output reg [7:0]dout;

localparam dep=3 // 4 bit address, 16 location
,wid=7;

reg [wid:0] fifmem [dep:0];
reg [2:0]wpt,rpt,cnt;

integer i;

always @ (posedge clk or posedge rst) begin
if(rst) begin
wpt<=0;
rpt<=0;
cnt<=0;
dout<=0;
full<=0;
emp<=0;

for (i=0;i<4;i=i+1) begin
	fifmem[i]=8'bZ;
end

end
else begin
	full<= (cnt==4);
	emp<= (cnt==0);
	
	if(wen && !full) begin
		fifmem[wpt]<=din;
		wpt<=wpt+1;
		cnt<=cnt+1;
	end
	
	else if (ren && !emp) begin
		dout<=fifmem[rpt];
		rpt<=rpt+1;
		cnt=cnt-1;
	end
	
	if(wpt>3'd7)
		wpt=3'd0;
	if(rpt>3'd7)
		rpt=3'd0;
end
end
endmodule