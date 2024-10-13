//Designed by Pavan V L
module atm_sys_tb;
reg clk,rst,pin_chk,pin_ent,amt_ent;
reg [13:0]pin,pin_cnfm;
reg [14:0]amt;
wire disp,issue;

atm_sys atm_sys_inst(clk,rst,pin_ent,pin_chk,pin,pin_cnfm,amt,amt_ent,disp,issue);

initial begin
clk=0;
rst=1;
pin_ent=0;
pin_cnfm=0;
pin=0;
pin_chk=0;
amt_ent=0;
amt=0;
$monitor("Enter-Pin=%0b  Pin= %0d  Check-Pin=%0b  Confirm-Pin= %0d  Enter-Amount=%0b  Amount= %0d  Dispense= %0b  Issue=%0b",pin_ent,pin,pin_chk,pin_cnfm,amt_ent,amt,disp,issue);
#220 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin
#10;pin_ent=1;
#2;pin=14'd8434;
#10;pin_chk=1;pin_ent=0;
#2;pin_cnfm=14'd8434;
#20;amt_ent=1;pin_chk=0;
amt=15'd15000;
#10;amt_ent=0;


#30;pin_ent=1;
#2;pin=14'd8434;
#4;pin_chk=1;pin_ent=0;
#2;pin_cnfm=14'd1234;
#20;amt_ent=1;pin_chk=0;
amt=15'd15000;
#10;amt_ent=0;


#30;pin_ent=1;
#2;pin=14'd5587;
#4;pin_chk=1;pin_ent=0;
#2;pin_cnfm=14'd5587;
#20;amt_ent=1;pin_chk=0;
amt=15'd20001;
#10;amt_ent=0;
end

endmodule