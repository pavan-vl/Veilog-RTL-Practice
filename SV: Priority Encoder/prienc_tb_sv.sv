//Designed by Pavan V L
module prienc83_tb_sv;
logic i0,i1,i2,i3,i4,i5,i6,i7;
logic o0,o1,o2;

prienc83 prienc83_inst(i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2,valid);

initial begin
i0=0;
i1=0;
i2=0;
i3=0;
i4=0;
i5=0;
i6=0;
i7=0;
$monitor(" i0 = %0b  i1 = %0b  i2 = %0b  i3 = %0b  i4 = %0b  i5 = %0b  i6 = %0b  i7 = %0b  o2=%0b  o1=%0b  o0=%0b  valid = %0b",i0,i1,i2,i3,i4,i5,i6,i7,o2,o1,o0,valid);
#90  $finish;
end

initial begin
#10; i0=1;
#10; i1=1;
#10; i2=1;
#10; i3=1;
#10; i4=1;
#10; i5=1;
#10; i6=1;
#10; i7=1;
end
endmodule
