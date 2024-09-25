//Designed by Pavan V L
module tris(in,out,en);
input [7:0]in;
input en;
output [7:0]out;

assign out= (en)?in:8'd0;

endmodule