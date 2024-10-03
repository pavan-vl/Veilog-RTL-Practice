//Designed by Pavan V L
module timer_tf(clk,rst,en,dur,out);
input clk,rst,en;
input [3:0]dur;
output reg out;

reg [3:0]cnt;

always @ (posedge clk or posedge rst) begin
if(rst) begin
out<=0;
cnt<=0;
end
else if (en) begin
if(cnt == dur) begin
out<=1;
cnt<=0;
end
else begin
cnt<= cnt + 4'd1;
out<=0;
end
end
else out<=0;
end
endmodule