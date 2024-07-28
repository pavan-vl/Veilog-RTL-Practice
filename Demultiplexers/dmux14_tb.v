//Designed by Pavan V L
module dmux14_tb;
reg i;
reg [1:0]sel;
wire o0,o1,o2,o3;

dmux14 dmux14_inst(i,sel,o0,o1,o2,o3);

initial begin
i=0;
sel=2'b0;
$monitor(" input=%0b  select=%0d  o0=%0b  o1=%0b  o2=%0b  o3=%0b",i,sel,o0,o1,o2,o3);
#40 $finish;
end

always
#2.5 i=~i;
always
#10 sel=sel+2'b01;

endmodule