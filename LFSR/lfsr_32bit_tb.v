//Designed by Pavan V L
module lfsr_32bit_tb;
reg clk,rst;
wire [31:0]out;

lfsr_32bit lfsr_32bit_inst(clk,rst,out);

initial begin
clk=0;
rst=1;
$monitor(" Output= %b  LFSR Value= %x ",out[31],out);
#200 $finish;
end

always #5 clk=~clk;

initial #15 rst=0;

endmodule