//Designed by Pavan V L
module clk_div(inclk,clkout);
input inclk;
output reg clkout;
reg [3:0]cnt;

initial begin
clkout=0;
cnt=4'd0;
end

always @ (posedge inclk) begin
	if(cnt==4'd9) begin
		clkout<=~clkout;
		cnt<=4'd0;
	end
	else begin
		cnt<=cnt+4'd1;
	end
end
endmodule