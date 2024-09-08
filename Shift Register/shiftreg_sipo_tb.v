//Designed by Pavan V L
module shiftreg_sipo_tb;
reg d,rst,clk;
reg [3:0]in_serial;
wire [3:0]qout;

shiftreg_sipo shiftreg_sipo_inst(d,rst,clk,qout);

initial begin
d=0;
rst=1;
clk=0;
in_serial=4'b000;
$monitor(" d=%0b  Serial Input=%b  rst=%0b  Register Values (q0q1q2q3) = %b  Output = %b ",d,in_serial,rst,{qout[0],qout[1],qout[2],qout[3]},qout);
#100 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin //Data is 1011
#20; d=1; in_serial[0]=d;
#10; d=0; in_serial[1]=d;
#10; d=1; in_serial[2]=d;
#10; d=1; in_serial[3]=d;
end

initial #60 d=0;
endmodule