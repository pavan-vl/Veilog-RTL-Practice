//Designed by Pavan V L
module clk_div(inclk,clkout);
input inclk;
output reg clkout;
reg [1:0]cnt;

initial begin
clkout=0;
cnt=2'd0;
end

always @ (posedge inclk) begin
	if(cnt==2'd3) begin
		clkout<=~clkout;
		cnt<=2'd0;
	end
	else begin
		cnt<=cnt+2'd1;
	end
end
endmodule