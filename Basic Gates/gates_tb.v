// Designed by Pavan V L
module gates_tb;
reg a,b;

wire ya,yna,yo,yno,yx,yxn,ynota,ynotb;

gates gates_inst(a,b,ya,yna,yo,yno,yx,yxn,ynota,ynotb);

initial begin
$monitor("a= %0b",a,"b= %0b",b,"ya= %0b",ya,"yna= %0b",yna,"yo= %0b",yo,"yno= %0b",yno,
"yx= %0b",yx,"yxn= %0b",yxn,"ynota= %0b",ynota,"ynotb= %0b",ynotb);
a=0;
b=0;
end

always 
#10 a=~a;
always
#20 b=~b; 

initial #80 $finish;


endmodule
