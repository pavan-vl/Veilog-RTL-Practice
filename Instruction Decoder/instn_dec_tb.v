//Designed by Pavan V L
module instn_dec_tb;
reg [31:0]instrn;
wire [6:0]op_code;
wire [4:0]src_reg_1,src_reg_2,dest_reg;
wire [2:0]fn3;
wire [6:0]fn7;

integer file;
reg [31:0] f_instn;
reg [255:0] f_opn;

instn_dec instn_dec_inst(instrn,op_code,src_reg_1,src_reg_2,dest_reg,fn3,fn7);

/* The Instruction Value in Hex and corresponding Instruction

0x00028233 ADD R3, R2, R1
0x02030333 SUB R4, R3, R1
0x000303B3 MUL R2, R2, R1

*/

initial begin
file= $fopen("F:/100days rtl/instrn_dec/instrn_dec.srcs/sim_1/imports/D64_ Instruction Decoder/Instruction_Lookup.txt", "r");
while (!$feof(file)) begin
$fscanf(file, "%h %s\n", f_instn, f_opn);
instrn= f_instn; 
#10; 
$display("Instruction= %x  Operation= %0s  Opcode= %b  Destination Register= %0d  Source Register 1= %0d  Source Register 2= %0d  Function3= %b  Function7= %b",instrn,f_opn,op_code,
dest_reg,src_reg_1,src_reg_2,fn3, fn7);
end
$fclose(file);
$finish;
end

endmodule