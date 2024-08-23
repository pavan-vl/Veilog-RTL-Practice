//Designed by Pavan V L
module pwm(duty,clk,rst,pwm);
input clk,rst;
input [3:0]duty;
output pwm;
reg [3:0]cnt;

always @ (posedge clk) begin
	if(rst) begin
	cnt=4'd0;
end
else begin
	if(cnt==4'd15)
	cnt<=4'd0;
	else
	cnt<=cnt+1;
end
end
assign pwm=(cnt<duty)?1:0;
endmodule
