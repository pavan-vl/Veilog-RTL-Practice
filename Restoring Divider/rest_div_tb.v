//Designed by Pavan V L
module rest_div_tb;
reg  [3:0]x,y;
wire [3:0]q,r;

rest_div rest_div_inst(x,y,q,r);

initial begin
x=4'd7;
y=4'd3;
$monitor(" Dividend= %d  Divisor= %d  Quotient= %d  Remainder= %d ",x,y,q,r);
#50 $finish;
end

initial begin 
#30; 
x=4'd13;
y=4'd3;
#10;
y=4'd0;
end

endmodule
