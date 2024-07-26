//Designed by Pavan V L
module hs_tb;
reg a,b;
wire d,bo;

hs hs_inst(a,b,d,bo);

initial begin
a=0;
b=0;
$monitor(" a=%0b ",a," b=%0b ",b," difference=%0b ",d," borrow=%0b ",bo);
#40 $finish;
end

always
#10 a=~a;
always
#20 b=~b;
endmodule