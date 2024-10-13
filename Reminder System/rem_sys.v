//Designed by Pavan V L
module rem_sys(clk,rst,set,dur,notif); //Reminder System
input clk,rst,set;
input [31:0]dur;
output reg notif;

localparam idle=0, wait_st=1, alert=2;
reg [1:0]state;
reg [31:0]cnt;

always @ (posedge clk or posedge rst) begin
if(rst) begin
state<=idle;
notif<=0;
cnt<=0;
end
else begin
	case(state) 
		idle: begin
				notif<=0;
				cnt<=0;
				if(set && dur!= 32'd0)
					state<=wait_st;
				else
					state<=idle;
		end
		
		wait_st: begin
				notif<=0;
				if(cnt==(dur-32'd1))
					state<=alert;
				else begin
					cnt<=cnt+32'd1;
					state<=wait_st;
				end
		end
		
		alert: begin
				notif<=1;
				state<=idle;
		end
		
		default: begin state<=idle; notif<=0; end
	endcase
end
end

endmodule
