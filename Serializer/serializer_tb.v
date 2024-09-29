//Designed by Pavan V L
module serializer_tb;
reg clk,rst,load;
reg [7:0]par_data;
wire ser_o;

serializer serializer_inst(clk,rst,par_data,load,ser_o);

initial begin
clk=0;
rst=1;
load=0;
par_data=8'd0;
$monitor(" Load=%b  Parallel-Input=%b  Serial-Out=%b ",load,par_data,ser_o);
#100 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial #4 load=1;

initial #17 load=0;

initial #6 par_data<=8'b10100110;

endmodule