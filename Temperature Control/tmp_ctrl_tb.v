//Designed by Pavan V L
module tmp_ctrl_tb;
reg [16:0]temp,low_thresh,high_thresh;
reg rst;
wire cool,heat;

tmp_ctrl tmp_ctrl_inst(temp,low_thresh,high_thresh,cool,heat,rst);

initial begin
rst=1;
temp=16'd54;
low_thresh=16'd20;
high_thresh=16'd26;
$monitor("Temperature= %0d  Lower-Threshold= %0d  Higher-Threshold= %0d Cool?= %s(%b)  Heat?= %s(%b)",temp,low_thresh,high_thresh,((cool)?"Yes":"No"),cool,((heat)?"Yes":"No"),heat);
#35 $finish;
end

initial #2 rst=0;

initial begin
#10;temp=16'd24; 
#10;temp=16'd18;
#10;temp=16'd26;
end

endmodule