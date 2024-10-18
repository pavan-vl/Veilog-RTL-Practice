//Desinged by Pavan V L
module mux21_tb;
logic i0,i1,sel;
logic o;

mux21 mux21_inst(i0,i1,sel,o);

initial begin
i0=0;
i1=0;
sel=0;
$monitor(" i0=%0b  i1=%0b  select=%0b  Output=%0b",i0,i1,sel,o);
#50 $finish;
end

always
#5 i0=~i0;
always 
#10 i1=~i1;
always 
#5 sel=$random%2;

endmodule