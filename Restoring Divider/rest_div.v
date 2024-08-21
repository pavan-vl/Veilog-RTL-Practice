//Designed by Pavan V L
module rest_div(dnd,dvr,clk,q,r);
input signed [3:0]dnd,dvr;
input clk;
output reg signed [3:0]q,r;
reg [3:0]a;    
reg [3:0]m;   
reg [2:0]cnt; 

initial begin
a=4'd0;
r=4'd0;

m=dvr;
q=dnd;
cnt=4'd4;
end

always @(posedge clk) begin

if (cnt>0) begin
// Rotate left Shift
a<= {a[2:0],q[3]};
q<= {q[2:0],1'b0}; //Update q

a<=a-m;

if (a[3]==1) begin
//restore
a<=a+m;
end 
end

else begin
q[0]<=1;
cnt<=cnt-1;
if (cnt==1) 
r<=a;

end
end
endmodule