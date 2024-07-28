//Designed by Pavan V L
module dmux12(i,sel,o0,o1);
input i,sel;
output o0,o1;

assign o0=(~sel)&i;
assign o1 = sel&i;

endmodule
