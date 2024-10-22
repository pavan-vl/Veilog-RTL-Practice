//Designed by Pavan V L
module dec24_tb_sv;

logic i0,i1;
logic o0,o1,o2,o3;

dec24_ah dec24_ah_inst(i0,i1,o0,o1,o2,o3);
//dec24_al dec24_al_inst(i0,i1,o0,o1,o2,o3); //For active low

initial begin
i0=0;
i1=0;
$monitor(" i0 = %0b  i1 = %0b  o0 = %0b  o1 = %0b  o2 = %0b  o3 = %0b ",i0,i1,o0,o1,o2,o3);
#40 $finish;
end

always
#10 i0=~i0;
always
#20 i1=~i1;

endmodule 

