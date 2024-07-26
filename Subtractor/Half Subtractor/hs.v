//Designed by Pavan V L
module hs(a,b,d,bo);
input a,b;
output d,bo;
assign d=a^b;
assign bo=(~a)&b;
endmodule