//Designed by Pavan V L
module vending_machine(clk,rst,item,coin_val,disp,chng,no_fund,no_item);
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
no_fund<=0;
no_item<=0;
end
else if(disp) begin
	if(coin_val==5'b00001)
		amt_ip<=amt_ip+rs1;
	else if(coin_val==5'b00010)
		amt_ip<=amt_ip+rs2;
	else if(coin_val==5'b00100)
		amt_ip<=amt_ip+rs5;	
	else if(coin_val==5'b01000)
		amt_ip<=amt_ip+rs10;
	else if(coin_val==5'b10000)
		amt_ip<=amt_ip+rs20;

	if(item[7:4]== 4'hA)
		price<=25;
	else if (item[7:4] == 4'hB) 
		price<=15;
	else if (item[7:4] == 4'hC) 
		price<=10;
	else if (item[7:4] == 4'hD) 
		price<=47;
	else if (item[7:4] == 4'hE) 
		price<=5;
	else if (item[7:4] == 4'hF) 
		price<=33;
	else
		no_item<=1;
	
	if(!no_item) begin
		if(amt_ip >=price) begin
			amt_ip<=amt_ip - price;
			chng<=amt_ip;
			if (coin_val == 5'b00001) 
				cnt[0]<=cnt[0] -1;
			else if (coin_val == 5'b00010) 
				cnt[1]<=cnt[1] -1;
			else if (coin_val == 5'b00100) 
				cnt[2]<=cnt[2] -1;
			else if (coin_val == 5'b01000) 
				cnt[3]<=cnt[3] -1;
			else if (coin_val == 5'b10000) 
				cnt[4]<=cnt[4] -1;	
		end
		else 
			no_fund<=1;
	end
end
end
endmodule
