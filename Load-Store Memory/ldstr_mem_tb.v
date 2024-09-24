//Designed by Pavan V L
module ldstr_mem_tb;
reg clk,rst,ren,wen;
reg [2:0]addr;
reg [31:0]wdata;
wire [31:0]rdata;
wire mem_en;

ldstr_mem ldstr_mem_inst(clk,rst,ren,wen,addr,wdata,rdata,mem_en);

initial begin
clk=0;
wen=1;
ren=0;
rst=1;
addr=3'd7;
wdata=32'hABCD1234;

$monitor(" Data-In= %x  Data-Out= %x  Write= %0b(%0s)  Read= %0b(%0s)  Address= %x  Memory-Enable= %0b ",wdata,rdata,wen,((wen)?"Yes":"No"),ren,((ren)?"Yes":"No"),addr,mem_en);


#140 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin
#20; addr=3'd4;
wdata=32'h7676DADE;

#20; addr=3'd3;
wdata=32'h98764321;

#20; addr=3'd2; ren=1; wen=0; wdata=32'd0;

#20; addr=3'd3;

#20; addr=3'd4;

#20; addr=3'd7;
end
endmodule