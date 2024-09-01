//Designed by Pavna V L
module single_pt_sram_tb;
reg clk,w_r;
reg [3:0]addr;
wire [7:0]data_io;

reg [7:0]tb_din;
wire [7:0]tb_dout;

single_pt_sram single_pt_sram_inst(data_io,w_r,clk,addr);

initial begin
clk=0;
w_r=1;
addr=4'd0;
tb_din=0;

$monitor(" Data=%0d  Write/Read= %s (%0d)  Address=%0d ",data_io,((w_r)?"Write":"Read"),w_r,addr);


#165 $finish;
end

assign data_io = ((w_r)?tb_din:8'bZ);

always #5 clk=~clk;

assign tb_dout=data_io;

initial begin
#5; tb_din=4'b1010;

#20; addr=4'd11;
tb_din=4'b0110;

#20; addr=4'd3;
tb_din=4'b1111;

#20; w_r=0;
addr=4'd0;

#20; w_r=1;
addr=4'd0;
tb_din=4'b0100;

#20;w_r=0;
addr=4'd11;

#20;w_r=0;
addr=4'd0;

#20;w_r=0;
addr=4'd3;

end
endmodule