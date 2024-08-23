//Designed Pavan V L
module digi_clock(clk,sec,min,hr);
input clk; //Designed for Clock signal of Period=10ms.      
output reg [5:0] sec, min; 
output reg [4:0] hr; 


reg [6:0] cnt; 

initial begin
sec=6'd1;
min=6'd0;
hr=5'd0;
cnt=7'd0;
end


always @(posedge clk) begin
if(cnt==7'd99) begin // For 100Hz Clock frequency division.
cnt<=7'd0;
end
else begin
cnt<=cnt+1;
end
end

always @(posedge clk) begin
if (sec==6'd60 && cnt==7'd99) begin
	sec<=6'd0;
	min<=min+1;
	if(min==6'd59) begin
		min<=6'd0;
		hr<=hr+1;
		if(hr==5'd23) begin
		hr<=5'd0;
		end
	end
end

else if(sec!=6'd60 && cnt==7'd99) begin
sec<=sec+1;
end
end
endmodule
