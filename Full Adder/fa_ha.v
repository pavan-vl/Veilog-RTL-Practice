//Designed by Pavan V L
module fa_ha(a,b,cin,s,co);
input a,b,cin;
output s,co;

wire ha1_sum, ha1_co, ha2_co;

ha ha_insta1(a,b,ha1_sum,h1_co);
ha ha_insta2(ha1_sum,cin,s,h2_co);

assign co=ha1_co | ha2_co;

endmodule