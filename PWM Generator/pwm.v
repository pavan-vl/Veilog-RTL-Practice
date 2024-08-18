//Designed by Pavan V L
module pwm(duty,clk,rst,pwm);
input clk,rst;
input [3:0]duty;
output reg pwm;
reg [3:0]cnt;

always @ (posedge clk) begin
	if(rst) begin
	pwm=4'd0;
	cnt=4'd0;
end
else begin
	if(cnt==4'd12)
	cnt<=4'd0;
	else
	cnt<=cnt+1;
	
	if(cnt<duty) begin
		pwm=1; 
	end
	else
		pwm=0;
end

endmodule