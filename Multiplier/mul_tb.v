//Designed by Pavan V L
module mul_tb;
reg signed [3:0]a,b;
wire signed [7:0]y;


mul mul_inst(a,b,y);

initial begin
a=4'd0;
b=4'd0;
$monitor(" a = %0d  b = %0d  product = %d ",a,b,y);
#30 $finish;
end

initial begin
a= (($random %15) + 1); b=(($random %15) + 1);
#10; a= (($random %15) + 1); b=(($random %15) + 1);
#10; a= -(($random %15) + 1); b=(($random %15) + 1);
end
endmodule
