//Designed by Pavan V L
module ceasar_ciph(pt,ct,key);
input [7:0]pt; //Plain text single character
input [4:0]key;
output reg [7:0]ct; //Cipher text single character


always @ * begin
if(pt <= 8'd122 && pt>= 8'd97) begin
ct = (pt+ (key %26)) -32 ;
end
else begin
	ct=8'bX;
end
end
endmodule

	
	