//Designed by Pavan V L
module gray_to_bin_tb;
reg [3:0]gry;
wire [3:0]bin;

gray_to_bin gray_to_bin_inst(gry,bin);

initial begin
gry=4'b0000;
$monitor(" Gray-Code (g3g2g1g0) = %b  Binary (b3b2b1b0) = %b    ",gry,bin);
#160 $finish;
end

always #10 gry=gry+4'b0001;

endmodule