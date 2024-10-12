module gates_tb_sv();
logic a,b;
logic ya,yna,yo,yno,yx,yxn,ynota,ynotb;

gates gates_inst(a,b,ya,yna,yo,yno,yx,yxn,ynota,ynotb);

initial begin
$monitor(" a= %0b ",a," b= %0b ",b," ya= %0b ",ya," yna= %0b ",yna,"y o= %0b ",yo," yno= %0b ",yno,
" yx= %0b ",yx," yxn= %0b ",yxn," ynota= %0b ",ynota," ynotb= %0b ",ynotb);
a=0;
b=0;
#80 $finish;
end

always 
#10 a=~a;
always
#20 b=~b;

endmodule