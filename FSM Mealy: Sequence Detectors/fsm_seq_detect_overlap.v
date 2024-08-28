//Designed by Pavan V L
module fsm_seq_detect_overlap(ser_in,clk,rst,out); //Sequence = 1001, Overlapping Mealy machine
input ser_in,clk,rst;
output reg out;

parameter a=2'b00, b=2'b01, c=2'b10, d=2'b11;

reg [1:0]state;

always @ (posedge clk) begin
if(rst) begin
state<=a;
out<=0;
end
else begin
	case (state)
		a: begin
			if(ser_in==0) begin
				state<=a;
				out<=0;
			end
			else begin
				state<=b;
				out<=0;
			end
		end
		b: begin
			if(ser_in==0) begin
				state<=c;
				out<=0;
			end
			else begin
				state<=b;
				out<=0;
			end
		end
		c: begin
			if(ser_in==0) begin
				state<=d;
				out<=0;
			end
			else begin
				state<=b;
				out<=0;
			end
		end
		d: begin
			if(ser_in==0) begin
				state<=a;
				out<=0;
			end
			else begin
				state<=b;
				out<=1;
			end
		end
		default:;
	endcase
end
end
endmodule