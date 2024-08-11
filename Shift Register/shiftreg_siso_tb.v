//Designed by Pavan V L
module shiftreg_siso_tb;
reg d,rst,clk;
wire q0,q1,q2,q3;

reg [3:0]in_serial;

shiftreg_siso shiftreg_siso_inst(d,rst,clk,q0,q1,q2,q3);

initial begin
d=0;
rst=1;
clk=0;
in_serial=4'b000;
$monitor(" d=%0b  Serial Input=%b  rst=%0b  Register Values (q0q1q2q3) = %b  Output = %b ",d,in_serial,rst,{q0,q1,q2,q3},q3);
#100 $finish;
end

always #5 clk=~clk;

initial #10 rst=0;

initial begin //Data is 1101
#20; d=1; in_serial[0]=d;
#10; d=0; in_serial[1]=d;
#10; d=1; in_serial[2]=d;
#10; d=1; in_serial[3]=d;
end

initial #60 d=0;
endmodule