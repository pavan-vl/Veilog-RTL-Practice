//Designed by Pavan V L
module digi_cmp_tb;
reg [3:0]a,b;
wire l_g,e;

digi_cmp digi_cmp_inst(a,b,l_g,e);

initial begin 
a=$random%16; 
b=$random%16;
$monitor(" A= %d  B= %d  Lesser?:%s(%b)  Greater?:%s(%b)  Equal?:%s(%b) ",a,b,	((l_g && e==0)?"Yes":(((~l_g) && e==0):"No":"No")),l_g,
((l_g && e==0)?"No":(((~l_g) && e==0):"Yes":"No")),~l_g,((e==1)?"Yes":"No"),e);
#50 $finish;
end

initial #10 a=4'd4;

initial #20 a=4'd7;

initial #20 b=4'd8;

initial #30 a=4'd10;

initial #40 b=4'd10;
endmodule