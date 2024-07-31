//Verilog code designed by Pavan V L
//Booth Algorithm based Multiplier
module mul(a,b,y);
input signed [3:0]a,b;
output reg signed [7:0]y;
reg [1:0]tmp;
integer i;
reg curr_val;
reg [3:0]neg_b;
always @ (*) begin
y=8'd0;
curr_val =1'd0;
for(i=0;i<4;i=i+1) begin
	tmp={a[i],curr_val}; //Concatinate and check condition
	neg_b=-b;
	case(tmp)
		2'b10: y[7:4]=y[7:4] + neg_b;
		2'b01: y[7:4]=y[7:4] + b;
		default:;
	endcase
	y=y>>1; //ASR
	y[7]=y[6]; //Preserve sign bit
	curr_val = a[i]; //Store current value 
end
if(b == 4'd8)
	y=-y;
end
endmodule
