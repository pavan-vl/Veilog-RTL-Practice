//Designed by Pavan V L
module status_flag_blk_tb;
reg rdata,master_ready,valid;
wire sin;

status_flag_blk status_flag_blk_inst(rdata,master_ready,valid,sin);

initial begin
rdata=0;
valid=0;
master_ready=0;
$monitor(" Read-Data=%0b  Valid=%0b  Master-Ready=%0b  Status-In=%0b ",rdata,valid,master_ready,sin);
#25 $finish;
end

initial begin
#2; rdata=1;
#2; master_ready=1;
#2; valid=1;
#2; rdata=0;
#2; rdata=1; valid=0;
#2;valid =1; master_ready=0;
#6; master_ready=1;
end

endmodule