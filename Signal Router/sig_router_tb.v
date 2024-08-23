//Designed by Pavan V L
module sig_router_tb;
reg [3:0]muxin;
reg [1:0]muxaddr,dmuxaddr;
wire [3:0]dmuxout;

sig_router sig_router_inst(muxin,muxaddr,dmuxaddr,dmuxout);

initial begin
muxin=4'd0;
muxaddr=2'd0;
dmuxaddr=2'd0;
$monitor("  Selected Data Line= %0d   Selected Output Line= %0d   Input= %b   Output= %b ",muxaddr+1,dmuxaddr+1,muxin,dmuxout);
#70 $finish;
end

initial begin
muxin=4'b0010;
muxaddr=2'd1;
dmuxaddr=2'd3;
#25;
muxin=4'b1101;
#10;
muxaddr=2'd3;
dmuxaddr=2'd0;
#40;
muxin=4'b0000;
end
endmodule