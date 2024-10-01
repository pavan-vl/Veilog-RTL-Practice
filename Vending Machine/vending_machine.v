//Designed by Pavan V L
module vending_machine(clk,rst,item,coin_val,disp,chng,item_given,no_fund,no_item);
input clk,rst,disp //Dispense Signal
;
input [7:0]item;
input [4:0]coin_val;

output reg [4:0]chng;
output reg no_fund,no_item;

localparam rs1=8'd1, rs2=8'd2, rs5=8'd5, rs10=8'd10, rs20=8'd20;

reg [4:0] cnt [4:0]; //Assuming initially there are 20 coins of each denomination
reg [7:0]price;
reg [7:0]amt_ip;

always @ (posedge clk or posedge rst) begin
if(rst) begin
cnt[0]<=20;
cnt[1]<=20;
cnt[2]<=20;
cnt[3]<=20;
cnt[4]<=20;
amt_ip<=0;
chng<=0;
price<=0;
item_given<=0;
no_fund<=0;
no_item<=0;
end
else if(disp) begin
	
