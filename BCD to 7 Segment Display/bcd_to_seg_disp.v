//Designed by Pavan V L
module bcd_to_seg_disp(in0,in1,in2,in3,a,b,c,d,e,f,g,dp); 
input in0,in1,in2,in3;
output a,b,c,d,e,f,g,dp;
reg [7:0]out;

// Common Cathode
always @ (*) begin
case ({in3,in2,in1,in0})
	4'd0: out=8'hFC;
	4'd1: out=8'h60;
	4'd2: out=8'hDA;
	4'd3: out=8'hF2;
	4'd4: out=8'h66;
	4'd5: out=8'hB6;
	4'd6: out=8'hBE;
	4'd7: out=8'hE0;
	4'd8: out=8'hFE;
	4'd9: out=8'hE6;
	default: out=8'h00;
endcase
end

// Common Anode

/*
always @ (*) begin
case ({in3,in2,in1,in0})
	4'd0: out=~(8'hFC);
	4'd1: out=~(8'h60);
	4'd2: out=~(8'hDA);
	4'd3: out=~(8'hF2);
	4'd4: out=~(8'h66);
	4'd5: out=~(8'hB6);
	4'd6: out=~(8'hBE);
	4'd7: out=~(8'hE0);
	4'd8: out=~(8'hFE);
	4'd9: out=~(8'hE6);
	default: out=~(8'h00);
endcase
end
*/


assign a=out[7];
assign b=out[6];
assign c=out[5];
assign d=out[4];
assign e=out[3];
assign f=out[2];
assign g=out[1];
assign dp=out[0];

endmodule	
