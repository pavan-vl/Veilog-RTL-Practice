//Designed by Pavan V L
module gcd_det_tb;
reg [15:0]a,b;
wire [15:0]gcd_o;

gcd_det gcd_det_inst(a,b,gcd_o);

initial begin
a=0;
b=0;
$monitor(" A= %0d  B= %0d  GCD= %0d",a,b,gcd_o);
#40 $finish;
end

initial begin
#4;a=16'd10; b=16'd20;
#10;a=16'd33; b=16'd12;
#10;a=16'd31; b=16'd37;
#10;a=16'hABCD; b=16'hFFFF;
end

endmodule