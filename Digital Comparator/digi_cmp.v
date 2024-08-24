//Designed by Pavan V L
module digi_cmp(a,b,l_g,e);
input [3:0]a,b;
output reg l_g //Less/Greater'
,e;

always @ * begin
if(a!=b) begin
e=0;
if(a<b)
l_g=1;
else
l_g=0;
end
else begin
e=1;
l_g=1'bX;
end
end
endmodule