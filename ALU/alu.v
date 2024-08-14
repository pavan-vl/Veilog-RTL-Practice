module alu(a,b,sel,y);
input [3:0]a,b,sel;
output reg [7:0]y;

always @ * begin
case(sel)
	4'h0: y=a+b;
	4'h1: y=a-b;
	4'h2: y=a*b;
	4'h3: y=a/b;
	4'h4: y=a&b;
	4'h5: y=~(a&b);
	4'h6: y=a|b;
	4'h7: y=~(a|b);
	4'h8: y=a^b;
	4'h9: y=~(a^b);
	4'hA: y=~a;
	4'hB: y=~b;
	default: y=y;
endcase
end
endmodule
