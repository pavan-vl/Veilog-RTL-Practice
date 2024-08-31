//Designed by Pavan V L
module fsm_sort_pair_det(ser_in,clk,rst,det);
// Detect 4-bits which are in sorted pair.
//For example: 1011 is 4bits of sorted pair of 2'd2(2'b10) and 2'd3(2'b11) (Ascending order)

input clk,rst,ser_in;
output reg det;

reg [3:0]state;

localparam a=0,b=1,c=2,d=3,e=4,f=5,g=6,h=7,i=8;

always @ (posedge clk) begin
if(rst) begin
det<=0;
state<=a;
end
else begin
	case(state)
		a: begin
			if(ser_in==0) begin
				det<=0;
				state<=b;
			end
			else begin
				det<=0;
				state<=g;
			end
		end
		b: begin
			if(ser_in==0) begin
				det<=0;
				state<=c;
			end
			else begin
				det<=0;
				state<=d;
			end
		end
		c: begin
			if(ser_in==0) begin
				det<=0;
				state<=e;
			end
			else begin
				det<=0;
				state<=c;
			end
		end
		d: begin
			if(ser_in==0) begin
				det<=0;
				state<=d;
			end
			else begin
				det<=0;
				state<=f;
			end
		end
		e: begin
			if(ser_in==0) begin
				det<=0;
				state<=a;
			end
			else begin
				det<=1;
				state<=a;
			end
		end
		f: begin
			if(ser_in==0) begin
				det<=1;
				state<=a;
			end
			else begin
				det<=0;
				state<=a;
			end
		end
		g: begin
			if(ser_in==0) begin
				det<=0;
				state<=h;
			end
			else begin
				det<=0;
				state<=a;
			end
		end
		h: begin
			if(ser_in==0) begin
				det<=0;
				state<=h;
			end
			else begin
				det<=0;
				state<=i;
			end
		end
		i: begin
			if(ser_in==0) begin
				det<=0;
				state<=a;
			end
			else begin
				det<=1;
				state<=a;
			end
		end
	endcase
end
end
endmodule