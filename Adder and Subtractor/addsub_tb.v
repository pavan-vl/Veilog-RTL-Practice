//Designed by Pavan V L	
module addsub_tb;
reg [3:0]a,b;
reg op,xin;
wire [3:0]s_d;
wire co_bo;

addsub addsub_inst(a,b,xin,op,s_d,co_bo);

initial begin
a=$random%16; 
b=$random%16;
xin=0;
op=0;
$monitor("operation is %s (%0d)", op ? "Subtraction" : "Addition", op);
$monitor(" a=%b  b=%b  xin=%b  sum / difference=%b  Carry / Borrow out=%b ",a,b,xin,s_d,co_bo); 

#80 $finish;
end

initial #40 op=1;

always 
#10 a=$random%16; 
always
#10 b=$random%16;
always
#10 xin=~xin;

endmodule