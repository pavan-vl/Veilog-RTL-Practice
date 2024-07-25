//Designed by Pavan V L
module fa(a,b,cin,s,co);
input a,b,cin;
output s,co;

assign s=a^b^cin; // Sum
assign co=(a&b)|(cin&(a^b)); //Carry out

endmodule