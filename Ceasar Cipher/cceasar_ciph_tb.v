//designed by Pavan V L
module ceasar_ciph_tb;
reg [7:0]pt;
reg [4:0]key;
wire [7:0]ct;

ceasar_ciph ceasar_ciph_inst(pt,ct,key);

initial begin
pt= "h";
key=3;
$monitor(" Plaintext= %c  Key=%0d  CipherText= %c",pt,key,ct);
#110 $finish;
end

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
