//Designed by Pavan V L
module enc42_al(i0,i1,i2,i3,o0,o1); //Active Low
input i0,i1,i2,i3;
output o0,o1;
assign o0= (~i1) | (~i3);
assign o1= (~i2) | (~i3);
endmodule