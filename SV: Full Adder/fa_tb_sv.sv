//Designed by Pavan V L
module fa_tb_sv;
logic a,b,cin;
logic s,co;

fa fa_inst(a,b,cin,s,co);

initial begin
a=0;
b=0;
cin=0;
$monitor(" a=%0b ",a," b=%0b ",b," cin=%0b ",cin," sum=%0b ",s," co=%0b ",co);
#80 $finish;
end

always 
#10 a=~a;
always
#20 b=~b;
always
#40 cin=~cin;

endmodule