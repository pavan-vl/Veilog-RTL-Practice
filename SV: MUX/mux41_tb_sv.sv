//Desinged by Pavan V L
module mux41_tb_sv;
logic i0,i1,i2,i3;
logic [1:0]sel;
logic o;

mux41 mux41_inst(i0,i1,i2,i3,sel,o);

initial begin
i0=0;
i1=0;
i2=0;
i3=0;
sel=2'b0;
$monitor(" i0=%0b  i1=%0b  i2=%0b  i3=%0b  select=%d  Output=%0b",i0,i1,i2,i3,sel,o);
#60 $finish;
end

always
#5 i0=~i0;
always 
#10 i1=~i1;
always
#15 i2=~i2;
always 
#20 i3=~i3;
always 
#5 sel=$random%4;

endmodule