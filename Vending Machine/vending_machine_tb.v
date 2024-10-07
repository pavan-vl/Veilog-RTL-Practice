//Designed by Pavan V L
module vending_machine_tb;
reg clk,rst,disp;
reg [7:0]item;
reg [4:0]coin_val;
wire [4:0]chng;
wire no_fund,no_item;

vending_machine vending_machine(clk,rst,item,coin_val,disp,chng,no_fund,no_item);

initial begin 
clk=0;
rst=1;
disp=0;
item=8'h00;
coin_val=5'b00000;
$monitor(" Item Code: %h  Dispense?= %s(%b)  Coin-Value= %d(%b)  Collected-Amount=%d  Price=%d  Invalid-item= %s(%b)",
		item,((disp)?"Yes":"No"),disp,(
    ((((coin_val == 5'b00001) ? 5'd1 :
       (coin_val == 5'b00010) ? 5'd2 :
       (coin_val == 5'b00100) ? 5'd5 :
       (coin_val == 5'b01000) ? 5'd10 : 5'd20)))
),coin_val,vending_machine.amt_ip, vending_machine.price,((no_item)?"Yes":"No"),no_item);
#225 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin
#1;disp=1;
item=8'hA5;
coin_val=5'b00001;
#10; coin_val=5'b00001;
#10; coin_val=5'b10000;
#10; coin_val=5'b01000;
#30;disp=0;
#20; disp=1;
item=8'hF2;
coin_val=5'b10000;
#10;coin_val=5'b10000;
#10;coin_val=5'b00100;
#10;coin_val=5'b00100;
#30;disp=0;
#20;disp=1;
item=8'hE4;
coin_val=5'b00001;
#30; disp=0;
#20; disp=1;
item=8'h43;
end

endmodule