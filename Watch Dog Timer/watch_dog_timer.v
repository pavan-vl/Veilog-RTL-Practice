//Designed by Pavan V L
module watch_dog_timer(clk,rst,wd_en,rst_o);
input clk,rst,wd_en;
output reg rst_o;

//parameter wait_time= 100; //Nuber of clock cycles to wait to send reset signal

reg [6:0] cnt; //9bits to store 100

always @ (posedge clk or posedge rst) begin
if(rst) begin
rst_o<=0;
cnt<=0;
end
else begin 
	if(wd_en) begin
		if(cnt<7'd99) begin
		    cnt<= cnt+ 7'b1;
		end
		else begin
			rst_o<=1;
			cnt<=0;
		end
	end
	else begin
	   cnt<=0;
	   rst_o=0;
	end
end
end
endmodule
			
	
