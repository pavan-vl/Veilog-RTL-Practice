//Designed by Pavan V L
module status_flag_blk(rdata,master_ready,valid,sin);
input rdata,master_ready,valid;
output sin;

wire dff_out;

dff dff_inst(valid,rdata,1'b1,dff_out);

wire nor1_o,nor2_o;

assign nor1_o= ~(rdata | nor_o);

assign nor2_o= ~( nor1_o | ( (~master_ready) & dff_out ) );

assign sin= nor1_o;

endmodule
