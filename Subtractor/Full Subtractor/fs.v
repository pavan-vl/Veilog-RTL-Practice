//Designed by Pavan V L
module fs(a,b,bin,d,bo);
input a,b,bin;
output d,bo;

assign d= a^b^bin; // Difference
assign bo = ((~a) & b) | bin & ((~a) | b); // Borrow

endmodule
