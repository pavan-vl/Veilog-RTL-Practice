//Designed by Pavan V L
module pwm_tb;
reg clk,rst;
reg [3:0]duty;
wire pwm;

pwm pwm_inst(duty,clk,rst,pwm);

initial begin
clk=0;
rst=1;
duty=4'd8;
$monitor(" Duty(val,%%)= %0d, %0d%%  PWM=%b ",duty,((duty*7'd100)/15),pwm);
#640 $finish;
end

always #5 clk=~clk;

initial #10 rst=0;

initial #165 duty=4'd4;

initial #325 duty=4'd12;

initial #485 duty=4'd5;

endmodule