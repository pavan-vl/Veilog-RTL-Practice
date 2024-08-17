//Designed by Pavan V L
module fdiv_20_tb;
reg insig;
wire sigout;

fdiv_20 fdiv_20_inst(insig,sigout);

initial begin
insig=1;
$monitor ("time = %0dns  Input=%b  Output=%b ",$time,insig,sigout);
#4000 $finish;
end


always #10 insig=~insig;

endmodule