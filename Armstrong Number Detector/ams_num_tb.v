//Designed by Pavan V L
module ams_num_tb;
reg [9:0]n;
wire ams_out;

ams_num ams_num_inst(n,ams_out);

initial begin
n=0;
$monitor(" Number=%0d  Armstrong? = %0s (%0b) ",n,((ams_out)?"Yes":"No"),ams_out);
#8 $finish;
end

initial #1 n=10'd147;
initial #4 n=10'd153;

endmodule