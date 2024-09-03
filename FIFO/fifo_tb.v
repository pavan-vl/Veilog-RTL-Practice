//Designed by Pavan V L
module fifo_tb;
reg [7:0]din;
reg clk,wen,ren,rst;
wire full,emp;
wire [7:0]dout;

fifo fifo_inst(din,clk,rst,wen,ren,full,emp,dout);

initial begin
clk=0;
rst=1;
wen=1;
ren=0;
din=8'd243;
$monitor(" Data Write=%d  Data read=%d  Write= %s (%d)  Read= %s (%d) ",din,dout,((wen)?"Yes":"No"),wen,((ren)?"Yes":"No"),ren);
#125 $finish;
end

always #5 clk=~clk;

initial #15 rst=0;

initial begin
#20; din=8'd214;
#10; din=8'd12;
#10; din=8'd3;
#10; ren=1; wen=1;// Not do anything condition
#20; wen=0;
#40; wen=1;ren=0; din=8'd200;

end
initial #105 wen=1;
endmodule