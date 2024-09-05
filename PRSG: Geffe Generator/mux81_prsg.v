//Designed by Pavan V L
module mux81_prsg(din,dout,sel);
input [7:0]din;
input [2:0]sel;
output reg dout;

always @ (sel) begin
	case(sel)
		3'd0:dout=din[0];
		3'd1:dout=din[1];
		3'd2:dout=din[2];
		3'd3:dout=din[3];
		3'd4:dout=din[4];
		3'd5:dout=din[5];
		3'd6:dout=din[6];
		3'd7:dout=din[7];
		default:;
	endcase
end
endmodule