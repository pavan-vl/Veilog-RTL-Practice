//Designed by Pavan V L
module freq_div(in_sig, sig_out);
input in_sig;
output reg sig_out;

initial begin
    sig_out = 0;
end

always @ (posedge in_sig) begin
    sig_out <= ~sig_out;
end

endmodule
