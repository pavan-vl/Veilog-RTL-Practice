//Deisgned by Pavan V L
module vernam_ciph_tb;
reg clk,rst;
reg [7:0]pt;
wire [7:0]ct;

vernam_ciph vernam_ciph_inst(pt,clk,rst,ct);

initial begin
pt= "h";
clk=0;
rst=1;
$monitor(" Plaintext= %c Plaintext in Binary= %b  Key=%b (%d)  CipherText= %b",pt,pt, vernam_ciph.key,vernam_ciph.key ,ct);
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
