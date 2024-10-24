//Designed by Pavan V L
module dff_tb_sv;
logic d,clk,rst;
logic q,qb;

dff_sync dff_sync_inst(d,clk,rst,q,qb);
//dff_async dff_async_inst(d,clk,rst,q,qb);  //For asynchronous reset

initial begin
d=0;
rst=1;
// rst=0; //For Asynchronous
clk=0;
$monitor(" time=%0d ns  d = %0b  rst = %0b  q = %0b  qb = %0b  ",$time,d,rst,q,qb);
#50 $finish;
end

always #5 clk=~clk;

always #10 d=~d;

initial #10 rst=0;

/* For Asynchronous
initial #10 rst=1;

initial #35 rst=0;*/


endmodule