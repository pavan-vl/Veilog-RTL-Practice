module ele_ctrl(clk,rst,req,curr_flr,moving);
input clk,rst;             
input [3:0] req;   
output reg [1:0] curr_flr;
output reg moving;

localparam FLOOR_G=2'b00, FLOOR_1=2'b01, FLOOR_2=2'b10, FLOOR_3=2'b11;   

reg [1:0]state; 
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state<=FLOOR_G;      
        curr_flr<=2'b00;
        moving<=0;
    end 
    else begin
        moving<=0; 
        case (state)
            FLOOR_G: begin
                if (req[1]) begin
                    state <= FLOOR_1; 
                    moving <= 1'b1;
                end 
                else if (req[2]) begin
                    state <= FLOOR_2; 
                    moving <= 1;
                end 
                else if (req[3]) begin
                    state <= FLOOR_3; 
                    moving <= 1'b1;
                end 
                else begin
                    state <= FLOOR_G;
                end
            end
            
            FLOOR_1: begin
                if (req[0]) begin
                    state <= FLOOR_G; 
                    moving <= 1;
                end 
                else if (req[2]) begin
                    state <= FLOOR_2; 
                    moving <= 1;
                end 
                else if (req[3]) begin
                    state <= FLOOR_3; 
                    moving <= 1'b1;
                end 
                else begin
                    state <= FLOOR_1;
                end
            end
            
            FLOOR_2: begin
                if (req[0]) begin
                    state <= FLOOR_G; 
                    moving <= 1'b1;
                end 
                else if (req[1]) begin
                    state <= FLOOR_1; 
                    moving <= 1'b1;
                end 
                else if (req[3]) begin
                    state <= FLOOR_3; 
                    moving <= 1'b1;
                end 
                else begin
                    state <= FLOOR_2;
                end
            end
            
            FLOOR_3: begin
                if (req[0]) begin
                    state <= FLOOR_G; 
                    moving <= 1'b1;
                end 
                else if (req[1]) begin
                    state <= FLOOR_1; 
                    moving <= 1'b1;
                end 
                else if (req[2]) begin
                    state <= FLOOR_2; 
                    moving <= 1'b1;
                end 
                else begin
                    state <= FLOOR_3;
                end
            end
            
            default: begin 
                state <= FLOOR_G; 
                moving <=0; 
            end
        endcase
        curr_flr <= state;
    end
end
endmodule
