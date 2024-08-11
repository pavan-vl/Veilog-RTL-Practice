//designed by Pavan V L
module jhnsncnt_tb;
reg clk,rst;
wire q0,q1,q2,q3;

jhnsncnt jhnsncnt_inst(clk,rst,q0,q1,q2,q3);

initial begin
rst=1;
clk=0;
$monitor(" rst=%0b  Output (q0q1q2q3) = %b  ",rst,{q0,q1,q2,q3});
#80 $finish;
end

always #5 clk=~clk;

initial #10 rst=0;

endmodule