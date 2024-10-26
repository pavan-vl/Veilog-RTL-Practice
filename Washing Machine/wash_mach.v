//Designed by Pavan V L
module wash_mach(clk,rst,start,mode);
input clk,rst,start;
output [2:0]mode;

localparam standby=0,fill=1,rinse=2,wash=3,spin=4;

reg [2:0] state;
reg [3:0]cnt;
always @ (posedge clk or posedge rst) begin
if(rst) begin
state<=standby;
cnt<=0;
end
else if(start) begin
	
	case(state)
		standby: begin
				
				state<=fill;
		end
		
		fill: begin
				 
				if(cnt!=4'd3) begin
					cnt<=cnt+ 4'd1;
					state<=fill;
				end
				else begin
					state<=rinse;
					cnt<=0;
				end
		end
		
		rinse: begin
				
				if(cnt!=4'd5) begin
					cnt<=cnt+4'd1;
					state<=rinse;
				end
				else begin
					state<=wash;
					cnt<=0;
				end
		end
		
		wash: begin
				
				if(cnt!=4'hA) begin
					cnt<=cnt+4'd1;
					state<=wash;
				end
				else begin
					state<=spin;
					cnt<=0;
				end
		end
		
		spin: begin
				
				if(cnt!=4'd8) begin
					cnt<=cnt+4'd1;
					state<=spin;
				end
				else begin
					state<=standby;
					cnt<=0;
				end
		end
		
		default: begin state<=standby; end
	endcase
end
else begin
state<=standby;
end
end

assign mode=state;

endmodule
