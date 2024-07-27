//Desinged by Pavan V L
module mux41_21(i0,i1,i2,i3,sel,o);
input i0,i1,i2,i3;
input [1:0]sel;
output o;

wire m1_o,m2_o;

mux21 mux21_inst1(i0,i1,sel[0],m1_o);
mux21 mux21_inst2(i2,i3,sel[0],m2_o);
mux21 mux21_inst3(m1_o,m2_o,sel[1],o);

endmodule

