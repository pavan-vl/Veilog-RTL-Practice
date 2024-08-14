//Designed by Pavan V L
module brlsft_tb;
reg l_r,rot,sv0,sv1;
reg [3:0]in;
wire [3:0]out;

brlshft brlshft_inst(l_r,rot,sv0,sv1,in,out);

initial begin
in=4'b1101;
l_r=1;
sv0=0;
sv1=0;
rot=0;
$monitor(" Rotate= %s(%b)  Direction= %s(%b)  Shift value= %d  Input= %b  Output= %b ", ((rot)?("Yes"):("No")),rot,((l_r)?("Left"):("Right")),l_r,{sv1,sv0},in,out);
#160 $finish;
end

always #10 sv0=~sv0;
always #20 sv1=~sv1;
always #40 l_r=~l_r;
always #80 rot=~rot;

endmodule