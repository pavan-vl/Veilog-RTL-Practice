//Designed by Pavan V L
module gray_to_bin(gry,bin);
input [3:0]gry;
output [3:0]bin;


assign bin[0]=gry[0]^bin[1];
assign bin[1]=gry[1]^bin[2];
assign bin[2]=bin[3]^gry[2];
assign bin[3]=gry[3];
endmodule