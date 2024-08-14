//Designed by Pavan V L
module brlshft(l_r,rot,sv0,sv1,in,out);
input l_r //Left / Right` Shift Direction signal
,rot //Rotate/ Normal` Shift operation signal
,sv0,sv1; // 2 bit Shift value signals {sv1,sv0}
input [3:0]in;
output [3:0]out;

assign out= ( 
				((rot==0 && l_r==1 && sv1==0 && sv0==0)?in:
				
				((rot==0 && l_r==1)?(in<<{sv1,sv0}):
				
				((rot==0 && l_r==0 && sv1==0 && sv0==0)?in:
				
				((rot==0 && l_r==0)?(in>>{sv1,sv0}):
				
				((rot==1 && l_r==1 && sv1==0 && sv0==0)?in:
				
				((rot==1 && l_r==1)?((in<<{sv1,sv0}) | (in>> (4-{sv1,sv0}))):
				
				((rot==1 && l_r==0 && sv1==0 && sv0==0)?in: (in>>{sv1,sv0} | (in<< (4-{sv1,sv0}))) )
				)
				)
				)
				)
				)
				)
);
endmodule