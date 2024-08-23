//Designed yy Pavan V L
//Restoring Divder Algorithm
module rest_div(x,y,q,r);
input [3:0]x //Dividend
,y; //Divisor
output reg [3:0]q,r;
reg [4:0]a;    
reg [4:0]m;   
integer i;
reg [4:0]neg_m;

always @(*) begin
if (y!=4'd0) begin
m[3:0]=y;
m[4]=0;
a=4'd0;
q=x;
for(i=0;i<4;i=i+1) begin
	//Shift Left
	a=a<<1;
	a[0]=q[3];
	q=q<<1;
	neg_m=-m;
	a=a+neg_m;
	if(a[4]==1) begin
		q[0]=0;
		a=a+m; //Restore
	end
	else
	q[0]=1;
end
r=a[3:0];
end
else
begin
	q=4'bxxxx;
	r=4'bxxxx;
end
end
endmodule
