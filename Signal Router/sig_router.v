//Designed by Pavan V L
module sig_router(muxin,muxaddr,dmuxaddr,dmuxout);
input [3:0]muxin;
input [1:0]muxaddr,dmuxaddr;
output [3:0]dmuxout;

wire muxout_dmuxin;

mux41 mux41_inst(muxin[0],muxin[1],muxin[2],muxin[3],muxaddr,muxout_dmuxin);

dmux14 dmux14_inst(muxout_dmuxin,dmuxaddr,dmuxout[0],dmuxout[1],dmuxout[2],dmuxout[3]);

endmodule