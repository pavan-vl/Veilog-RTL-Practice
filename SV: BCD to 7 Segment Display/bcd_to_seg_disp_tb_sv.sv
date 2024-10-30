//Designed by Pavan V L
module bcd_to_seg_disp_tb_sv;
logic in0,in1,in2,in3;
bit a,b,c,d,e,f,g,dp;



bcd_to_seg_disp bcd_to_seg_disp_inst(in0,in1,in2,in3,a,b,c,d,e,f,g,dp);

initial begin
{in3,in2,in1,in0}=4'b0000;
$monitor(" Input value (in3in2in1in0) = %d (%b)    Output Lines (a,b,c,d,e,f,g,DP) = %b,%b,%b,%b,%b,%b,%b,%b (%h) ",{in3,in2,in1,in0},{in3,in2,in1,in0},a,b,c,d,e,f,g,dp,{a,b,c,d,e,f,g,dp});
#110 $finish;
end

always #10 {in3,in2,in1,in0}= {in3,in2,in1,in0} + 4'b0001;

endmodule