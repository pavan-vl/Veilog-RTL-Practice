//Designed by Pavan V L
module alu_tb;
reg [3:0]a,b,sel;
wire [7:0]y;

reg [8*16:1]op; //To hold operation String of length 15 characters.

alu alu_inst(a,b,sel,y);

task operation;
	input [3:0]sel;
	output reg [8*16:1]op;
	case (sel)
	4'h0: op="Addition";
	4'h1: op="Subtraction";
	4'h2: op="Multiplication";
	4'h3: op="Division";
	4'h4: op="Loical AND";
	4'h5: op="Loical NAND";
	4'h6: op="Loical OR";
	4'h7: op="Loical NOR";
	4'h8: op="Loical XOR";
	4'h9: op="Loical XNOR";
	4'hA: op="NOT of a";
	4'hB: op="NOT of b";
	default: op="Memory/No change";
	endcase
endtask

always @ (sel) begin
	operation(sel,op);
end	

initial begin
a=4'hC;
b=4'hE;
sel=4'h0;
$monitor(" a=%b  b=%b  Operation= %16s (sel= %d)  Output= %b ",a,b,op,sel,y);
#130 $finish;
end

always #10 sel=sel+4'h1;

endmodule