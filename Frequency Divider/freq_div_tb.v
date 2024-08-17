//Designed by Pavan V L
module freq_div_tb;
reg in_sig;
wire sig_out;

freq_div freq_div_inst(in_sig,sig_out);

initial begin
in_sig=1;
$monitor ("time = %0dns  Input=%b  Output=%b ",$time,in_sig,sig_out);
#50 $finish;
end


always #5 in_sig=~in_sig;

endmodule