//Designed by Pavan V L
module syncnt(i,rst,clk,q0,q1,q2,q3);
input i,clk,rst;
output reg q0,q1,q2,q3;
reg [3:0]q;



always @ (posedge clk, posedge rst) begin
if(rst)
q=4'b0000;
else begin
q<=q+1'b1;
end

end

always @ * begin
q0=q[0];
q1=q[1];
q2=q[2];
q3=q[3];
end
endmodule