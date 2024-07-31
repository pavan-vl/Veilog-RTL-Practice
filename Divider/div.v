//Verilog code designed by Pavan V L
//Non Restoring Algorithm based Divider
module div(x,y,q,r);
input [3:0] x,y;  
output reg [3:0] q,r;
reg [7:0]a ;    
reg [3:0] m;    
reg [4:0] i;    

always @(*) begin
a = {4'b0, x};  
m = y;          
q = 4'b0;       

for (i = 0; i < 4; i = i + 1) begin
    a = {a[6:0], q[3]}; 
    if (a[7:4] >= m) begin
        a[7:4] = a[7:4] - m; 
        q = {q[2:0], 1'b1};  
    end 
	else begin
         a[7:4] = a[7:4] + m; 
         q = {q[2:0], 1'b0}; 
    end
end

if (a[7:4] >= m) begin
    a[7:4] = a[7:4] - m;
end
r = a[7:4];
end
endmodule