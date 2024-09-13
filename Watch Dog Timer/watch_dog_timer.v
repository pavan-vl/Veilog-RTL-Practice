//Designed by Pavan V L
module watch_dog_timer(clk,rst,wdt_en,rst_o);
input clk,rst,wd_en;
output reg rst_o;

parameter wait_time= 500; //Nuber of clock cycles to wait to send reset signal

reg [8:0] cnt; //9bits to store 500

always @ (posedge clk or posedge rst) begin
if(rst) begin
rst_o<=0;
cnt<=0;
end
else begin
	if(wd_en) begin
		cnt<=0;
		rst_o<=0;
	end
	else begin
		if(cnt==wait_time)
			rst_o<=1;
		else begin
			cn<= cnt+ 1;
		end
	end
end
end
endmodule
			
	