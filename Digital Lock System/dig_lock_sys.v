//Designed by Pavan V L
module digi_lock(clk,rst,pin,login_pin,set_pin,login,lock,intrusion_alert);
input clk, rst;
input [3:0] pin;         
input [3:0] login_pin;   
input set_pin;           
input login;             
output reg lock;        
output reg intrusion_alert;

localparam IDLE = 2'b00, SET_PIN = 2'b01, LOGIN = 2'b10, ALERT = 2'b11;

reg [1:0] state;
reg [3:0] stored_pin;
reg [2:0] cnt;

always @(posedge clk or posedge rst) begin
if (rst) begin
state <= IDLE;
lock <=0;
intrusion_alert<=0;
stored_pin <=4'b0000;
cnt <=3'b000;
end 
else begin
    case (state)
        IDLE: begin
            lock <=0;
            intrusion_alert<=0;
			cnt<=3'd0;
            if (set_pin) begin
                state <=SET_PIN;
            end
            else if (login) begin
                state <= LOGIN;
            end
            else begin
                state <=IDLE;
            end
        end

        SET_PIN: begin
            stored_pin <=pin;
            state <=IDLE;
        end

        LOGIN: begin
            if (login_pin == stored_pin) begin
                lock <=1;
                state <= IDLE;
            end 
            else begin
                intrusion_alert <=1;
                cnt <=3'd5; 
                state <=ALERT;
            end
        end

        ALERT: begin
            if (cnt>0) begin
                cnt <= cnt-1;
            end 
            else begin
                intrusion_alert <=0;
                state <=IDLE;
            end
        end

        default: begin
            state <=IDLE;
            lock <=0;
            intrusion_alert<=0;
            cnt <=3'd0;
        end
    endcase
end
end
endmodule
