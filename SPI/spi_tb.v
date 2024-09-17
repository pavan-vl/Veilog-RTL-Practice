module spi_tb;
reg clk,start;
reg [11:0]din;
wire cs,mosi,done,sclk;

spi spi_inst(clk,start,din,cs,mosi,done,sclk);

initial begin
clk=0;
start=0;
din=12'hA08;
wait(done == 1);
#100;
$finish;
end

always #5 clk = ~clk;

initial #10 start=1;

endmodule
