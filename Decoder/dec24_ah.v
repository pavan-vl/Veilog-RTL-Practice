//Designed by Pavan V L
module dec24_ah(i0,i1,o0,o1,o2,o3); // Active High
input i0,i1;
output o0,o1,o2,o3;

assign o0= (~i0)&(~i1);
assign o1= (i0)&(~i1);
assign o2= (~i0)&(i1);
assign o3= (i0)&(i1);

endmodule