//Designed by Pavan V L
module atm_sys(clk,rst,pin_ent,pin_chk,pin,pin_cnfm,amt,amt_ent,disp,issue); // ATM system Implementation
input clk,rst,pin_chk,pin_ent,amt_ent;
input [13:0]pin,pin_cnfm;
input [14:0]amt;
output reg disp,issue;

localparam idle=0,enter=1,confirm=2,match=3,enter_amt=4,transact=5;
reg [2:0]state;

always @ (posedge clk or posedge rst) begin
if(rst) begin
state<=idle;
disp<=0;
issue<=0;
end
else begin
	case(state) 
		idle: begin
			disp<=0;
			issue<=0;	
			if(pin_ent)
				state<=enter;
			else 
				state<=idle;
		end
		
		enter: begin
			disp<=0;
			if(pin!=14'd0 && pin_chk)
				state<=confirm;
			else if (pin==14'd0) begin
				state<=idle;
				issue<=1;
			end
			else begin
				state<=idle;
				issue<=0;
			end
		end
		
		confirm: begin
				disp<=0;
				if(pin == pin_cnfm) begin
					state<=match;
					issue<=0;
				end
				else begin
					state<=idle;
					issue<=1;
				end
		end
		
		match: begin
				disp<=0;
				issue<=0;
				if(amt_ent)
					state<=enter_amt;
				else
					state<=match;
		end
		
		enter_amt: begin
				disp<=0;
				if(amt >=15'd20000) begin
					state<=idle;
					issue<=1;
				end
				else begin
					issue<=0;
					state<=transact;
				end
		end
		
		transact: begin
				disp<=1;
				issue<=0;
				state<=idle;
		end
		
		default: begin state<=idle; disp<=0; issue<=0; end
	endcase

end
end
endmodule
