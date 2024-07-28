//Designed by Pavan V L
module dmux14(i,sel,o0,o1,o2,o3);
input i;
input [1:0]sel;
output o0,o1,o2,o3;


assign o0 = i&(~sel[0])&(~sel[1]);
assign o1 = i&(sel[0])&(~sel[1]);
assign o2 = i&(~sel[0])&(sel[1]);
assign o3 = i&(sel[0])&(sel[1]);

endmodule
