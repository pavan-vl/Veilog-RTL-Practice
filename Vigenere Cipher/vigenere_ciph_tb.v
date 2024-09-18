//Designed by Pavan V L
module vigenere_ciph_tb;
reg [7:0]pt;
reg clk,rst;
wire [7:0]ct;

vigenere_ciph vigenere_ciph_inst(pt,clk,rst,ct);

initial begin
pt= "h";
clk=0;
rst=1;
$monitor(" Plaintext= %c  Key=%d  CipherText= %c",pt, vigenere_ciph.key ,ct);
#110 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin
#10; pt = "e"; 
#10; pt = "l"; 
#10; pt = "l"; 
#10; pt = "o"; 
#10; pt = "w"; 
#10; pt = "o"; 
#10; pt = "r"; 
#10; pt = "l"; 
#10; pt = "d"; 
#10; pt = "2"; 
end
endmodule
