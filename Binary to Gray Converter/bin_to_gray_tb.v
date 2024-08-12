//Designed by Pavan V L
module bin_to_gray_tb;
reg [3:0]bin;
wire [3:0]gry;

bin_to_gray bin_to_gray_inst(bin,gry);

initial begin
bin=4'b0000;
$monitor("  Binary (b3b2b1b0) = %b   Gray-Code (g3g2g1g0) = %b ",bin,gry);
#160 $finish;
end

always #10 bin=bin+4'b0001;

endmodule