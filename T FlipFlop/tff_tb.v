//Designed by Pavan V L
module tff_tb;
reg t,clk,rst;
wire q,qb;

tff_sync tff_sync_inst(t,clk,rst,q,qb);
//tff_async tff_async_inst(t,clk,rst,q,qb);  //For asynchronous reset

initial begin
t=0;
rst=1;
//rst=0; //For Asynchronous
clk=0;
$monitor(" time=%0d ns  t = %0b  rst = %0b  q = %0b  qb = %0b  ",$time,t,rst,q,qb);
#90 $finish;
end

always #5 clk=~clk;

always #30 t=~t;

initial #10 rst=0;

/*For Asynchronous
initial #10 rst=1;*/

endmodule
