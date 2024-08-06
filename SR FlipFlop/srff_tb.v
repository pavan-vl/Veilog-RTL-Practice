module srff_tb;
reg s,r,clk,rst;
wire q,qb;

srff srff_inst(s,r,clk,rst,q,qb);

initial begin
s=0;
r=0;
clk=0;
rst=1;
$monitor(" time=%0d ns  s = %0b  r = %0b  rst = %0b  q = %0b  qb = %0b  ",$time,s,r,rst,q,qb);
#60 $finish;
end

always #5 clk = ~clk;

always #10 s=~s;

always #20 r=~r;

initial #10 rst=0;

endmodule