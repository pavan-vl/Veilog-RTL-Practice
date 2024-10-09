//Designed by Pavan V L
module gcd_det(a,b,gcd_o);
input [15:0]a,b;
output reg [15:0]gcd_o;

reg [15:0]x,y;
reg [1:0]state;

localparam idle=0,cmp=1,sub=2,fin=3;

always @ (*) begin
x=a;
y=b;
repeat(16) begin
if(x>y)
x=x-y;
else
y=y-x;
end
gcd_o=x;
end

endmodule