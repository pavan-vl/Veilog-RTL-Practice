//Designed by Pavan V L
module fsm_bit_flip_detect(ser_in,clk,rst,det); //Detect transition from 0 to 1 or 1 to 0, Overlapping
input ser_in,clk,rst;
output reg det;

reg [1:0]state;

parameter A=2'b11, B=2'b00, C=2'b01;

always @ (posedge clk) begin
if(rst) begin
det<=0;
state<=A;
end
else begin
	case(state)
		A: begin
			if(ser_in==0) begin
				state<=B;
				det<=0;
			end
			else begin
				state<=C;
				det<=0;
			end
		end
		B: begin
			if(ser_in==0) begin
				state<=B;
				det<=0;
			end
			else begin
				state<=C;
				det<=1;
			end
		end
		C: begin
			if(ser_in==0) begin
				state<=B;
				det<=1;
			end
			else begin
				state<=C;
				det<=0;
			end
		end
		default:;
	endcase
end
end
endmodule