//Designed by Pavan V L
module prienc83(i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2,valid);
input i0,i1,i2,i3,i4,i5,i6,i7;
output o0,o1,o2,valid;

assign o0 = i7 | ( (~i6)&(i5 | ((~i4)&(i3 | (~i2)&i1))) );
assign o1 = i7 | i6 | ( (~i5)&(~i4)&(i3 | i2)  );
assign o2 = i7 | i6 | i5 | i4;
assign valid = i7 | i6 | i5 | i4 | i3 | i2 | i1 | i0;
endmodule
