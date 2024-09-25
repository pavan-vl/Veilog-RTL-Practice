//Designed by Pavan V L
module tris_o(in,out,en);
input [7:0]in;
input [7:0]en;
output [7:0]out;

assign out= en&in;

endmodule