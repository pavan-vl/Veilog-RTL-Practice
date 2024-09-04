//Designed by Pavan V L
module lfsr_tb;
reg clk,rst;
wire [3:0]out;

lfsr lfsr_inst(clk,rst,out);

initial begin
clk=0;
rst=1;
$monitor(" time=%0d ns  Output= %0b   q2=%0b  q1=%0b  q0=%0b   LFSR Value=%b ",$time,out[3],out[2],out[1],out[0],out);
#200 $finish;
end

always #5 clk=~clk;

initial #15 rst=0;

endmodule