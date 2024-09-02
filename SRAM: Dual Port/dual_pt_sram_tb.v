//Designed by Pavan V L
module dual_pt_sram_tb;
reg clk,wen,ren;
reg [7:0]din;
reg [3:0]addrr,addrw;
wire [7:0]dout;

dual_pt_sram dual_pt_sram_inst(din,wen,ren,clk,addrw,addrr,dout);

initial begin
din=4'd0;
clk=0;
addrr=0;
addrw=12;
wen=1;
ren=0;
$monitor(" Data Written=%0d  Data Read=%0d  Write= %s (%0d)  Read= %s (%0d)  Write Address=%0d  Read Address=%0d ",din,dout,((wen)?"Yes":"No"),wen,((ren)?"Yes":"No"),ren,addrw,addrr);
#65 $finish;
end

always #5 clk=~clk;

initial begin
din=8'd246; 
#10;
addrw=4'd11;
#7;
ren=1;
addrr=4'd12;
din=8'd200;
#10;
addrr=4'd11;
addrw=4'd0;
wen=0;
#10;
wen=1;
addrw=4'd10;
din=8'd144;
addrr=4'd10;
end

endmodule