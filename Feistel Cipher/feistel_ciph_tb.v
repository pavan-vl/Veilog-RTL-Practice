//Designed by Pavan V L
module feistel_ciph_tb;
reg [15:0]pt;
reg [127:0]key;
wire [15:0]ct;

feistel_ciph feistel_ciph_inst(pt,ct,key);

initial begin
pt={"h","e"};
key=128'h3F8A92B7_D4C1E609_F1AB34CD_7E58A3F2;
$display("Key= %h",key);
$monitor(" Plain-Text=%c %c  Cipher-text= %b(%c) %b(%c)",pt[15:8],pt[7:0],ct[15:8],ct[15:8],ct[7:0],ct[7:0]); 
#60 $finish;
end

initial begin
#10; pt={"l","l"};
#10; pt={"o","w"};
#10; pt={"o","r"};
#10; pt={"l","d"};
end
endmodule