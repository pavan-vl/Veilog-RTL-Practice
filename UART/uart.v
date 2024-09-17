module uart(clk,start,rx,txin,tx,rxdone,txdone,rxout);
input clk,start,rx;
input [7:0] txin;
output reg tx, rxdone, txdone;
output [7:0] rxout,

parameter clk_dur = 100_000;
parameter baud = 9600;
parameter clk_baud_fact = clk_dur / baud;
 
reg done_sig = 0;
integer cnt = 0;
parameter idle = 0, transmit = 1, chk = 2;
reg [1:0] state = idle;

reg [9:0] txData;
integer curr_bit = 0; 
reg [9:0] tx_shift = 0;


integer rx_cnt = 0;
integer rx_curr_bit = 0;
parameter rx_idle = 0, rx_wait = 1, recv = 2, rx_chk = 3;
reg [1:0] rx_state;
reg [9:0] rxdata;

 
//Generate Trigger
always@(posedge clk)
begin
if(state == idle) begin 
	cnt <= 0;
end
else begin
    if(cnt == clk_baud_fact) begin
		done_sig<=1;
        cnt<=0;  
    end
else begin
		cnt   <= cnt + 1;
		done_sig <= 1'b0;  
    end    
end
end
 
//Transmitter
 
always@(posedge clk)
begin
case(state)
idle:begin
        tx<= 1;
        txData<= 0;
        curr_bit<=0;
        tx_shift<=0;
        if(start==1'b1) begin
			txData <= {1'b1,txin,1'b0};
            state  <= transmit;
        end
        else begin           
			state <= idle;
        end
    end
 
transmit: begin
           tx<=txData[curr_bit];
           state<=chk;
           tx_shift<= {txData[curr_bit], tx_shift[9:1]};
		end 
  
chk: 
	begin
		if(curr_bit <= 9) begin
			if(done_sig == 1'b1) begin
				state<=transmit;
				curr_bit<=curr_bit + 1;
			end
		end
		else begin
			state<=idle;
			curr_bit<=0;
		end
    end
 
default:state<=idle;
 
endcase
 
end

assign txdone = (curr_bit == 9 && done_sig == 1'b1) ? 1'b1 : 1'b0;
 
 
//Receiver

always@(posedge clk) begin
case(rx_state)
rx_idle : 
	begin
		rxdata <= 0;
		rx_curr_bit <= 0;
		rx_cnt <= 0;
        
        if(rx == 1'b0) begin
			rx_state <= rx_wait;
         end
        else begin
			rx_state <= rx_idle;
        end
    end
     
rx_wait : 
	begin
		if(rx_cnt < clk_baud_fact / 2) begin
			rx_cnt<=rx_cnt + 1;
			rx_state<=rx_wait;
		end
		else begin
			rx_cnt<=0;
			rx_state<=recv;
			rxdata<={rx,rxdata[9:1]}; 
		end
	end
 
 
recv : 
	begin
		if(rx_curr_bit<=9) begin
			if(done_sig==1) begin
			rx_curr_bit<=rx_curr_bit+1;
			rx_state<=rx_wait;
			end
		end
		else begin
			rx_state <= rx_idle;
			rx_curr_bit <= 0;
		end
	end

default:rx_state<=rx_idle;
 
 
endcase
end

assign rxout=rxdata[8:1]; 
assign rxdone= (rx_curr_bit==9 && done_sig==1'b1)?1'b1:1'b0;
endmodule
 
