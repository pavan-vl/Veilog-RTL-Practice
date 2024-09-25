//Designed by Pavan V L
module top_par_int_8bit_tb;
reg clk,rst,w_r;
wire [7:0]di_o,do_i;

reg [7:0]d_input,d_output;

assign di_o = w_r & d_input;
assign do_i = (~w_r) & d_output;

top_par_int_8bit top_par_int_8bit_inst(clk,rst,di_o,do_i,w_r);

always #5 clk=~clk;

initial #2 rst=0;

initial begin
rst=1;
clk=0;
w_r=1;
d_input=8'b11010110;
$monitor( "data-In-Out= %b  data-Out-In= %b  Write/Read= %b(%s) ",di_o,do_i,w_r,((w_r)?"Write":"Read"));
#100 $finish;
end

initial begin
#30; w_r=0;
d_output=8'hFF;
end

endmodule