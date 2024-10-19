//Designed by Pavan V L
module dmux12_tb_sv;
logic i,sel;
logic o0,o1;

dmux12 dmux12_inst(i,sel,o0,o1);

initial begin
i=0;
sel=0;
$monitor(" input=%0b  select=%0b  o0=%0b  o1=%0b",i,sel,o0,o1);
#50 $finish;
end

always
#5 i=~i;
always
#5 sel=$random%2;

endmodule