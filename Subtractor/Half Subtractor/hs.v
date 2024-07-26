//Designed by Pavan V L
module hs(a,b,d,bo);
input a,b;
output d,bo;
assign d=a^b; // Difference
assign bo=(~a)&b; // Borrow
endmodule
