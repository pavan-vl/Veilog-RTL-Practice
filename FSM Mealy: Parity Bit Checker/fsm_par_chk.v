//Designed by Pavan V L
module fsm_par_chk(ser_in,clk,rst,par); //Counts for odd parity
input ser_in,clk,rst;
output reg par;

reg state;

always @ (posedge clk) begin
if(rst) begin
state<=0;
par<=0;
end
else begin
case(state)
	1'b0: begin
		if(ser_in==1) begin
			state<=1;
			par<=1;
		end
		else begin
			state<=0;
			par<=0;
		end
	end
	1'b1:begin
		if(ser_in==1) begin
			state<=0;
			par<=0;
		end
		else begin
			state<=1;
			par<=1;
		end
	end
	default:;
endcase
end
end
endmodule