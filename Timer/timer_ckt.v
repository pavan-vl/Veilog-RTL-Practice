//Designed by Pavan V L
module timer_ckt(time_dur,out_int,rst,clk);
input clk,rst;
input reg [3:0]time_dur;
output reg out;
reg [3:0]cnt;

always @ (posedge clk or negedge rst) begin
if(rst) begin
cnt<=4'd0;
out<=0;
end
else begin
	cnt<=time_dur;
	if(cnt==4'd0) begin
		out<=1;
		cnt<=time_dur;
	end
	else if(cnt>4'd0) begin
		cnt=cnt-4'd1;
		out<=0;
	end
end
endmodule	