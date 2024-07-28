//Designed by Pavan V L
module dmux14_12(i,sel,o0,o1,o2,o3);
input i;
input [1:0]sel;
output o0,o1,o2,o3;

wire dm1_o0,dm1_o1;

dmux12 dmux12_inst1(i,sel[0],dm1_o0,dm1_o1);
dmux12 dmux12_inst2(dm1_o0,sel[1],o0,o1);
dmux12 dmux12_inst3(dm1_o1,sel[1],o2,o3);

endmodule