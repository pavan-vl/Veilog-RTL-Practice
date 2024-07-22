module gates(a,b,ya,yna,yo,yno,yx,yxn,ynota,ynotb);
input a,b;
output ya,yna,yo,yno,yx,yxn,ynota,ynotb;

assign ya=a&b;
assign yna=~ya;
assign yo=a|b;
assign yno=~yo;
assign yx=a^b;
assign yxn=~yx;
assign ynota=~a;
assign ynotb=~b;


endmodule
