//Designed by Pavan V L
module mux21(i0,i1,sel,o);
input i1,i0,sel;
output o;
assign o=((~sel)&i0)|(sel&i1);
endmodule
