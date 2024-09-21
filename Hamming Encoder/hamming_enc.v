//Designed by Pavan V L
module hamming_enc( din,enc_o); // 7,4 hamming Encoder  
input [3:0] din;
output reg [6:0] enc_o;

always @(*) begin
enc_o[2] = din[3];  
enc_o[4] = din[2];  
enc_o[5] = din[1];  
enc_o[6] = din[0];  
enc_o[0] = din[3] ^ din[2] ^ din[0]; 
enc_o[1] = din[3] ^ din[1] ^ din[0]; 
enc_o[3] = din[2] ^ din[1] ^ din[0]; 
end

endmodule