//Designed by Pavan V L
module jkff_tb_sv;
logic j,k,clk,rst;
bit q,qb;

jkff jkff_inst(j,k,clk,rst,q,qb);

initial begin
j=0;
k=0;
clk=0;
rst=1;
$monitor(" time=%0d ns  j = %0b  k = %0b  rst = %0b  q = %0b  qb = %0b  ",$time,j,k,rst,q,qb);
#60 $finish;
end

always #5 clk = ~clk;

always #10 j=~j;

always #20 k=~k;

initial #10 rst=0;

endmodule