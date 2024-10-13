//Designed by Pavan V L
module tmp_ctrl(temp,low_thresh,high_thresh,cool,heat,rst); //Simple Implementation of Temperature Control
input [16:0]temp,low_thresh,high_thresh;
input rst;
output reg cool,heat;

always @ * begin
if(rst) begin
cool=0;
heat=0;
end
else begin
	if( temp >= high_thresh) begin
		cool=1;
		heat=0;
	end
	else if (temp <= low_thresh) begin
		cool=0;
		heat=1;
	end
	else if ( temp> low_thresh && temp <high_thresh) begin
		cool=0;
		heat=0;
	end
end
end

endmodule
