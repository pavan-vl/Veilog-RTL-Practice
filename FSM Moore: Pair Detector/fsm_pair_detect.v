//Designed by Pavan V L
module fsm_pair_detect(ser_in,clk,rst,det);
input ser_in,clk,rst;
output reg det;

reg [1:0]state;

always @ (posedge clk) begin
if(rst) begin
state<=2'd0;
det<=0;
end
else
begin
	case(state)
		2'b00: begin
				if(ser_in==1)
					state<=2'b01;
				else
					state<=2'b10;
				end
		2'b01: begin
				if(ser_in==1)
					state<=2'b11;
				else
					state<=2'b10;
				end
		2'b10: begin
				if(ser_in==1)
					state<=2'b01;
				else
					state<=2'b11;
				end
		2'b11: begin
				if(ser_in==1)
					state<=2'b01;
				else
					state<=2'b10;
				end
	endcase
end
if(state==2'b11)
det<=1;
else if(state!=2'b11)
det<=0;
end
endmodule	
