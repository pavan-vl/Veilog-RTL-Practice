//Designed by Pavan V L
module fs_tb;
logic a,b,bin;
logic d,bo;

fs fs_inst(a,b,bin,d,bo);

initial begin
a=0;
b=0;
bin=0;
$monitor(" a=%0b ",a," b=%0b ",b," borrow in=%0b ",bin," difference=%0b ",d," borrow=%0b ",bo);
#80 $finish;
end

always
#10 a=~a;
always
#20 b=~b;
always
#40 bin=~bin;
endmodule