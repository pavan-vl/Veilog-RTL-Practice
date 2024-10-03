//Designed Pavan V L
module tflt_sys(clk,rst,r,y,g);
input clk,rst;
output reg r,y,g;

reg [1:0]state;
wire timer_r,timer_y,timer_g;

localparam idle=0,red=1,yel=2,gre=3;

timer_tf timer_tf_inst_red(clk,rst,(state==red),4'd10,timer_r);
timer_tf timer_tf_inst_yellow(clk,rst,(state==yel),4'd2,timer_y);
timer_tf timer_tf_inst_green(clk,rst,(state==gre),4'd15,timer_g);


always @ (posedge clk or posedge rst) begin
if(rst) begin
state<=idle;
r<=0;
g<=0;
y<=0;
end
else begin	
	case(state) 
		idle: begin
				r=0;
				g=0;
				y=0;
				state<= (rst)?idle:red;
		end
		
		red: begin
				y=0;
				g=0;
				r=1;
				state<= (timer_r)?yel:red;
			end
		
		yel: begin
				y=1;
				g=0;
				r=0;
				state<= (timer_y)?gre:yel;
			end
			
		gre: begin
				y=0;
				g=1;
				r=0;
				state<= (timer_g)?red:gre;
			end
			
		default: state<=idle;
	endcase
end
end
endmodule
