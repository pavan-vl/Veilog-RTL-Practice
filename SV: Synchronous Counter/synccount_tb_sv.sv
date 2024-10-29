//Designed by Pavan V L
module synccount_tb_sv;
logic i,clk,rst;
logic q0,q1,q2,q3;

syncnt synccount_inst(i,rst,clk,q0,q1,q2,q3);

initial begin 
i=0;
clk=0;
rst=1;
$monitor (" i=%0b  rst=%0b  Output in binary (q3q2q1q0) = %0b%0b%0b%0b  Output in decimal = %d ",i,rst,q3,q2,q1,q0,{q3,q2,q1,q0});
#170 $finish;
end

initial #7.5 rst=0;

initial #10 i=1;

always #5 clk=~clk;

endmodule