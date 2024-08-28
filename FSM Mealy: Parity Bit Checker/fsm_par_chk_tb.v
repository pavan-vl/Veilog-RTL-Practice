//Designed by Pavan V L
module fsm_par_chk_tb;
reg ser_in,clk,rst;
wire par;

fsm_par_chk fsm_par_chk_inst(ser_in,clk,rst,par);

initial begin
clk=0;
rst=1;
ser_in=0;
$monitor(" Input=%0b  Reset=%0b  Output=%0b ",ser_in,rst,par);
#165 $finish;
end

always #5 clk=~clk;

initial begin
#30;ser_in=1;
#10;ser_in=0;
#10;ser_in=1;
#30;ser_in=0;
#20;ser_in=1;
#10;ser_in=0;
#10;ser_in=1;
end

initial #15 rst=0;

endmodule

