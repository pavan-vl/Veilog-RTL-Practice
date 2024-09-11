//Designed by Pavan V L
module uni_shft_reg(ser_inl,ser_inr,par_in,sel,clk,rst,par_out,ser_outr,ser_outl);
input ser_inl,ser_inr,clk,rst;
input [1:0]sel;
input [3:0]par_in;
output ser_outl,ser_outr;
output [3:0]par_out;

reg [3:0]q;

always @ (posedge clk or posedge rst) begin
if(rst) begin
	q<=0;
end
else begin
	case (sel)
		2'd1: begin
		    q[3]<=ser_inr;
			q[2]<=q[3];
			q[1]<=q[2];
			q[0]<=q[1];
		    
			
		end
		
		2'd2: begin
			q[0]<=ser_inl;
			q[1]<=q[0];
			q[2]<=q[1];
			q[3]<=q[2];
		end
		
		2'd3: begin
			q<=par_in;
		end		
		default: q<=q;
endcase
end
end
assign ser_outl = (sel==2'd2)?q[3]:1'b0;
assign ser_outr = (sel==2'd1)?q[0]:1'b0;
assign par_out = q;

endmodule