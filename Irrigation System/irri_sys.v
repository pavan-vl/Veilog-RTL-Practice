//Designed by Pavan V L
module irri_sys(clk,rst,wtr_lvl,ir);
input clk,rst;
input [7:0]wtr_lvl;
output reg ir;

localparam idle=0,irrigate=2,wait_st=3,chk=1;

reg [1:0]state;
reg [255:0]cnt;

always @ (posedge clk or posedge rst) begin
if(rst) begin
state<=idle;
cnt<=0;
ir<=0;
end
else begin
	case (state)
		idle: begin
				ir<=0;
				state<=chk;
				
		end
		
		chk: begin
				ir<=0;
				if(wtr_lvl<=8'd51) begin
				state<=irrigate;
				end
				else
				state<=chk;
		end
		
		irrigate: begin
				ir<=1;
				state<=wait_st;
		end
		
		wait_st: begin
				ir<=0;
				if(cnt!={256{1'b1}}) begin
					cnt<=cnt+ 256'd1;
					state<=wait_st;
				end
				else begin
					state<=chk;
					cnt<=0;
				end
		end
		
		default: begin state<=idle; ir<=0; end
		
	endcase
end
end
endmodule
