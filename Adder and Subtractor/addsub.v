//Design by Pavan V L
module addsub(a,b,xin,op,s_d,co_bo);
input [3:0]a,b; //Inputs
input xin // Carry-in or Borrow-in
,op; //Operation = Addition' / Subtraction: 0 for Addition, 1 for Subtraction
output [3:0]s_d; //Sum / Difference
output co_bo; //Carry-out / Borrow-out

wire aip0,aip1,aip2,aip3, // Input to full adder based on operation
co_bo1,co_bo2,co_bo3;

// Determining whether the value has to be subtraced or added: op=1, aip=~a(Sub); op=0,aip=a(Add);

xor xor_inst1(aip0,a[0],op);
xor xor_inst2(aip1,a[1],op);
xor xor_inst3(aip2,a[2],op);
xor xor_inst4(aip3,a[3],op);

fa fa_inst1(aip0,b[0],xin,s_d[0],co_bo1);
fa fa_inst2(aip1,b[1],co_bo1,s_d[1],co_bo2);
fa fa_inst3(aip2,b[2],co_bo2,s_d[2],co_bo3);
fa fa_inst4(aip3,b[3],co_bo3,s_d[3],co_bo);

endmodule
