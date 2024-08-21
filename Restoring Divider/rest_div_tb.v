//Designed by Pavan V L
module rest_div_tb;
reg signed [3:0]dnd,dvr;
reg clk;
wire signed [3:0]q,r;

rest_div rest_div_inst(dnd,dvr,clk,q,r);

initial begin
dnd=4'd7;
dvr=4'd3;
clk=0;
$monitor(" Dividend= %d  Divisor= %d  Quotient= %d  Remainder= %d ",dnd,dvr,q,r);
#50 $finish;
end

initial begin 
#30; 
dnd=-4'd15;
dvr=4'd2;
end

always #5 clk=~clk;

endmodule