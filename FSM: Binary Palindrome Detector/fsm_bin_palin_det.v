//Designed by Pavna V L
module fsm_bin_palin_det(ser_in,clk,rst,det); //Detect 3-bit binary palindrome, Non-overlapping
input ser_in,clk,rst;
output reg det;

reg [2:0]state;
 
localparam A=3'd0, B=3'd1, C=3'd2, D=3'd4, E=3'd5;

always @ (posedge clk) begin
if(rst) begin
state<=A;
det<=0;
end
else begin
	case(state) 
		A: begin 
			if(ser_in==0) begin
			state<=B;
			det<=0;
			end
			else begin
			state<=D;
			det<=0;
			end
		end
		B: begin 
			if(ser_in==0 || ser_in==1) begin
			state<=C;
			det<=0;
			end
		end
		C: begin 
			if(ser_in==0) begin
			state<=A;
			det<=1;
			end
			else begin
			state<=A;
			det<=0;
			end
		end
		D: begin 
			if(ser_in==0 || ser_in==1) begin
			state<=E;
			det<=0;
			end
		end
		E: begin 
			if(ser_in==0) begin
			state<=A;
			det<=0;
			end
			else begin
			state<=A;
			det<=1;
			end
		end
		default:;
	endcase
end
end
endmodule