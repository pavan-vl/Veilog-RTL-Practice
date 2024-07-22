//Designed by Pavan V L
module ha_tb;
reg a,b;
wire s,co;

ha ha_inst(a,b,s,co);

initial begin
a=0;b=0;
$monitor(" a=%0b ",a," b=%0b " ,b," sum=%0b ",s," carry out=%0b ",co);
#40 $finish;
end

always 
#10 a=~a;
always
#20 b=~b;
endmodule
