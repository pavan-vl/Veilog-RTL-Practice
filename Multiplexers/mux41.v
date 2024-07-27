//Desinged by Pavan V L
module mux41(i0,i1,i2,i3,sel,o);
input i0,i1,i2,i3;
input [1:0]sel;
output reg o;

always @ (*) begin
case(sel)
2'd0:o=i0;
2'd1:o=i1;
2'd2:o=i2;
2'd3:o=i3;
default:;
endcase
end

endmodule
