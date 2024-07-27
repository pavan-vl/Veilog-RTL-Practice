//Designed by Pavan V L
//Full adder using 2 half adders
module fa_ha(a,b,cin,s,co);
input a,b,cin;
output s,co;

wire ha1_sum, ha1_co, ha2_co, carry_total;

ha ha_insta1(.a(a), .b(b), .s(ha1_sum), .co(h1_co));
ha ha_insta2(.a(ha1_sum), .b(cin) , .s(s) , .co(h2_co));
or or_inst(co,h1_co,h2_co);

endmodule
