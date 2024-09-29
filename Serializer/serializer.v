//Designed by Pavan V L
module serializer(clk,rst,par_data,load,ser_o);
input clk,rst,load;
input [7:0]par_data;
output reg ser_o;

reg [7:0]mem_reg;
reg [2:0]cnt;

always @ (posedge clk or posedge rst) begin
if(rst) begin
mem_reg<=0;
cnt<=0;
ser_o<=0;
end
else begin
if(load) begin
mem_reg<=par_data;
cnt<=3'd0;
end
else begin
ser_o<= mem_reg[7];
mem_reg<= mem_reg<<1;
cnt<= cnt + 3'd1;
end
end
end

endmodule
