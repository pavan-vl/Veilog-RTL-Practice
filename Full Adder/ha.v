//Designed by Pavan V L
module ha(a,b,s,co);
input a,b;
output s,co;
assign s=a^b; //SUM
assign co=a&b; //CARRY OUT
endmodule