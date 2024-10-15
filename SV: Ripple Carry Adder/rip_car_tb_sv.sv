// Designed by Pavan V L
module ripcarry_tb_sv;
logic [3:0]a,b;
logic cin;
logic [3:0]s;
logic co;

ripplecarry ripplecarry_inst(a,b,cin,s,co);

initial begin
a=4'b0000;
b=4'b0000;
cin=0;
$monitor( " a=%0b ",a," b=%0b ",b," cin=%0b ",cin," sum=%0b ",s," carry out=%0b ",co);
#50 $finish;
end

always begin
#10; 
a=$random%16;
b=$random%16;
cin=$random%2;
end


endmodule