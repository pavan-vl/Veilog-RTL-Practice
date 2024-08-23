//Designed by Pavan V L
module timer_ckt(time_dur,out_int,clk,cnt,stop_sig);
input clk,stop_sig;
input [3:0]time_dur;
output reg out_int;
output reg [3:0]cnt;

initial begin
cnt=0;
out_int=0;
end

always @ (posedge clk) begin
if(stop_sig) begin
out_int<=0;
cnt<=0;
end
else begin
if(cnt!=4'd0)
cnt<=cnt-4'd1;
else
cnt<=time_dur;
out_int <= (cnt==4'd1);
end	
end
endmodule
