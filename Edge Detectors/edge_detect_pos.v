//Designed by Pavan V L
module edge_detect_pos(sig,clk,out);
input sig,clk;
output reg out;
reg delay_reg;

initial out=0;

always @ (posedge clk) begin
delay_reg<=sig;
out<=(sig & ~(delay_reg));
end
endmodule