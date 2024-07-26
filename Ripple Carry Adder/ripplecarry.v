//Designed by Pavan V L
module ripplecarry(a,b,cin,s,co);
input [3:0]a,b;
input cin;
output [3:0]s;
output co;

wire c1,c2,c3;

fa fa_inst1(a[0],b[0],cin,s[0],c1);
fa fa_inst2(a[1],b[1],c1,s[1],c2);
fa fa_inst3(a[2],b[1],c2,s[2],c3);
fa fa_inst4(a[3],b[1],c3,s[3],co);

endmodule
