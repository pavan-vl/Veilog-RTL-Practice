//Designed by Pavan V L
module enc42_tb_sv;
logic i0,i1,i2,i3;
logic o0,o1;

enc42_ah enc42_ah_inst(i0,i1,i2,i3,o0,o1);
//enc42_al enc42_al_inst(i0,i1,i2,i3,o0,o1); //For Active Low

initial begin
i0=1;
i1=1;
i2=1;
i3=1;
$monitor(" i0 = %0b  i1 = %0b  i2 = %0b  i3 = %0b  o0 = %0b  o1 = %0b ",i0,i1,i2,i3,o0,o1); 
#60 $finish;
end

initial begin
#5; i0=~i0; #10;  i0=~i0;
#5; i1=~i1; #10;  i1=~i1;
#5; i2=~i2; #10;  i2=~i2;
#5; i3=~i3; #10;  i3=~i3;
end
endmodule