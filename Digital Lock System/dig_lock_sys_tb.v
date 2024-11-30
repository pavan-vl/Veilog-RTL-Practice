//Designed by Pavan V L
module digi_lock_tb;

reg clk,rst;
reg [3:0] pin;
reg [3:0] login_pin;
reg set_pin, login;
wire lock, intrusion_alert;

digi_lock digi_lock_inst(clk,rst,pin,login_pin,set_pin,login,lock,intrusion_alert);

initial begin
clk=0;
rst=1;
pin=4'd0;
login_pin=4'd0;
set_pin=0;
login=0;
$monitor(" Pin= %h  Login Pin= %h  Lock Open= %s (%b)  Intruder?= %s (%b) ",pin,login_pin,((lock)?"Yes":"No"),lock,((intrusion_alert)?"Yes":"No"),intrusion_alert);
#150 $finish;
end

initial #2 rst=0;

always #5 clk=~clk;

initial begin
#5;
set_pin=1;
pin=4'hA;
#10; set_pin=0;
#10; login_pin=4'hA;
login=1;
#10; login=0;
    
#30;
login_pin=4'hF;
login=1;
#10; login=0;
end

endmodule
