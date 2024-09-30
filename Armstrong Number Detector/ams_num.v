//Designed by Pavan V L
module ams_num(n,ams_out); // Detect Armstrong Number
input [9:0]n;
output reg ams_out;

reg [3:0]d1,d2,d3;
reg [19:0]s; 

always @ * begin
d1=n/100;
d2=(n/10) %10;
d3=n%10;

s=(d1*d1*d1)+(d2*d2*d2)+(d3*d3*d3);
if(s==n)
ams_out=1;
else
ams_out=0;
end
endmodule
