module instn_dec(instrn,op_code,src_reg_1,src_reg_2,dest_reg,fn3,fn7);
// Designed for 32-bit instruction set of Risc V Arch
input [31:0]instrn;
output reg [6:0]op_code;
output reg [4:0]src_reg_1,src_reg_2,dest_reg;
output reg [2:0]fn3;
output reg [6:0]fn7;

always @ * begin
op_code= instrn[6:0];         
dest_reg= instrn[11:7];            
src_reg_1= instrn[19:15];          
src_reg_2= instrn[24:20];          
fn3= instrn[14:12];       
fn7= instrn[31:25];       
end

endmodule
