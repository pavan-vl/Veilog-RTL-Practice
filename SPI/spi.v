module spi(clk,start,din,cs,mosi,done,sclk);
input clk, start; 
input [11:0]din;
output reg cs, mosi, done; 
output sclk;
 
integer cnt=0;
integer bitcnt = 0;
reg sclk_t=0;

parameter idle=0,tx_start=1,send=2,tx_end=3; 
reg [1:0]state=idle;
reg [11:0]tmp;

always@(posedge clk)
begin
    if(cnt<10)
    cnt<=cnt+1;
    else begin
    cnt<=0;
    sclk_t<=~sclk_t;
    end
end

always@(posedge sclk_t) begin
case(state)
    idle: begin
        mosi<=0;
        cs<=1;
        done<=0;
        if(start)
            state<=tx_start;
        else
            state <= idle;
    end
	
    tx_start: begin
            cs<=0;
            tmp<=din; 
            state<=send; 
    end
	
    send: begin
        if(bitcnt <= 11) begin
            bitcnt<=bitcnt+1;
            mosi<=tmp[bitcnt];
            state<=send;
        end
        else begin
            bitcnt<=0;
            state<=tx_end;
            mosi<=0; 
        end
    end
	
    tx_end: begin
        cs<=1;
        state<=idle;
        done<=1;
    end
    
	default:state<=idle;
endcase
end
 
assign sclk = sclk_t;
endmodule