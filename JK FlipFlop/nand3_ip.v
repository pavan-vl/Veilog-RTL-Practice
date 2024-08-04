//Designed by Pavan V L
module nand3_ip(y,a,b,c);
input a,b,c;
output y;

wire ab;

and a1(ab,a,b);
nand na1(y,ab,c);

endmodule