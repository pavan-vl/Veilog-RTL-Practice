//Designed by Pavan V L
module udcnt_tb_sv;
logic i,rst,clk,u_d;
logic q0,q1,q2,q3;

udcnt udcnt_inst(i,u_d,rst,clk,q0,q1,q2,q3);

initial begin 
i=0;
clk=0;
rst=1;
u_d=1;
$monitor (" i=%0b  rst=%0b  Up/Down=%s (%0b)  Output in binary (q3q2q1q0) = %0b%0b%0b%0b  Output in decimal = %d ",i,rst,((u_d)?"Up":"Down"),u_d,q3,q2,q1,q0,{q3,q2,q1,q0});
#335 $finish;
end

initial #7.5 rst=0;

initial #10 i=1;

always #5 clk=~clk;

initial #170 u_d=0;

endmodule