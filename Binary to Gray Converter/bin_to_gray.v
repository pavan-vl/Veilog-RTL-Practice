//Designed by Pavan V L
module bin_to_gray(bin,gry);
input [3:0]bin;
output [3:0]gry;

assign gry[0]=bin[0]^bin[1];
assign gry[1]=bin[1]^bin[2];
assign gry[2]=bin[3]^bin[2];
assign gry[3]=bin[3];
endmodule