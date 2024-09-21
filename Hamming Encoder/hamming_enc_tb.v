//Designed by Pavan V L
module hamming_enc_tb;
reg [3:0]din;
wire [6:0]enc_o;

hamming_enc hamming_enc_inst(din,enc_o);

initial begin
din=4'b1010;
$monitor(" Input=%b  Encoded Data=%b ",din,enc_o);
#30 $finish;
end
initial #10 din=4'b1100;
initial #20 din=4'b0110;
endmodule