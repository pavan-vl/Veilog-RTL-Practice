// Designed by Pavan V L
module gates(a,b,ya,yna,yo,yno,yx,yxn,ynota,ynotb);
input a,b;
output ya,yna,yo,yno,yx,yxn,ynota,ynotb;

assign ya=a&b; //AND
assign yna=~ya; //NAND
assign yo=a|b; //OR
assign yno=~yo; //NOR
assign yx=a^b; //XOR
assign yxn=~yx; //XNOR
assign ynota=~a; //NOT of a
assign ynotb=~b; //NOT of b


endmodule
