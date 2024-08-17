//Designed by Pavan V L
module fdiv_20(insig,sigout);
input insig;
output reg sigout;
reg [4:0]cnt;

initial begin
sigout=0;
cnt=5'd0;
end

always @ (posedge insig) begin
	if(cnt==5'd19) begin
		sigout<=~sigout;
		cnt<=5'd0;
	end
	else begin
		cnt<=cnt+5'd1;
	end
end
endmodule