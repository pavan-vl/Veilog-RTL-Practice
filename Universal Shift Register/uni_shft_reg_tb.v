//Designed by Pavan V L
module uni_shft_reg_tb;
reg ser_inl,ser_inr,clk,rst;
reg [1:0]sel;
reg [3:0]par_in;
wire ser_outl,ser_outr;
wire [3:0]par_out;

reg [3:0]in_serial;

uni_shft_reg uni_shft_reg_inst(ser_inl,ser_inr,par_in,sel,clk,rst,par_out,ser_outr,ser_outl);

initial begin
rst=1;
clk=0;
ser_inl=0;
ser_inr=0;
sel=0;
in_serial=4'b000;
par_in=in_serial;
$monitor(" Serial-In Right=%0b  Serial-In Left=%0b    Parallel-In =%b  Serial Input=%b  rst=%0b  select=%0d  Parallel-Out(q0q1q2q3) = %b  Serial Output = %b ",ser_inr,ser_inl,par_in,in_serial,rst,sel,par_out,((sel==2'd1)?ser_outr:((sel==2'd2)?ser_outl:1'b0)));
#300 $finish;
end

always #5 clk=~clk;

initial #2 rst=0;

initial begin 
//Data is 1101 serial left
sel=2'd2;
#20; ser_inl=1; in_serial[0]=ser_inl;
#10; ser_inl=0; in_serial[1]=ser_inl;
#10; ser_inl=1; in_serial[2]=ser_inl;
#10; ser_inl=1; in_serial[3]=ser_inl;
#10; ser_inl=0; 

#40;

//Data is 1111 serial right
sel=2'd1;
ser_inr=1; in_serial[0]=ser_inr;
#10; ser_inr=1; in_serial[1]=ser_inr;
#10; ser_inr=1; in_serial[2]=ser_inr;
#10; ser_inr=1; in_serial[3]=ser_inr;
#10; ser_inr=0; 


#35; sel=3'd3; par_in=4'b0110;
#20;par_in=0;
//Memory state
sel=2'd0;

#40;
//Parallel-In 
sel=2'd3;
par_in=4'b1010;
#40;
sel=2'd0;
par_in=0;
end

endmodule