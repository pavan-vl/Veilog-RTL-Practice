//Designed Pavan V L
module digi_clock(clk,rst,sec,min,hr);
input wire clk // Taking 10Hz Clock signal
,rst;      
output reg [5:0] sec, min; 
output reg [4:0] hr; 

reg [3:0] clk_div; 

always @(posedge clk) begin
if (rst)
clk_div <= 0;
else begin
if (clk_div==4'd9) begin 
clk_div <= 0;
end 
else begin
clk_div <= clk_div + 1;
end
end
end

wire clk_1s = (clk_div == 4'd9);

always @(posedge clk) begin
if (rst)
sec <= 0;
else if (clk_1s) begin
if (sec == 6'd59) 
sec <= 0;
else 
sec<=sec+1;
end
end

always @(posedge clk) begin
if (rst)
min<=0;
else if (clk_1s && (sec==6'd59)) begin
    if (min==6'd59)
		min<=0;
    else
        min <= min + 1;
    end
end

always @(posedge clk or posedge rst) begin
if (rst)
hr<=0;
else if (clk_1s && (sec==6'd59) && (min==6'd59)) begin
if (hr==5'd23)
hr <= 0;
else 
hr <= hr + 1;
end
end

endmodule