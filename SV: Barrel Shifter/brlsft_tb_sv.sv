//Designed by Pavan V L
module brlsft_tb_sv;
bit l_r,rot,sv0,sv1;
bit [3:0]in;
bit [3:0]out;

brlshft brlshft_inst(l_r,rot,sv0,sv1,in,out);

class simulate;
bit l_rc,rotc,sv0c,sv1c;
bit [3:0]inc;

function new();
inc=4'b1101;
l_rc=1;
sv0c=0;
sv1c=0;
rotc=0;
endfunction

function void upd_sv0();
sv0c=~sv0c;
endfunction

function void upd_sv1();
sv1c=~sv1c;
endfunction

function void upd_lr();
l_rc=~l_rc;
endfunction

function void upd_rot();
rotc=~rotc;
endfunction

endclass

simulate sim_obj;

initial begin
sim_obj=new();
in=sim_obj.inc;
l_r=sim_obj.l_rc;
sv0=sim_obj.sv0c;
sv1=sim_obj.sv1c;
$monitor(" Rotate= %s(%b)  Direction= %s(%b)  Shift value= %d  Input= %b  Output= %b ", ((rot)?("Yes"):("No")),rot,((l_r)?("Left"):("Right")),l_r,{sv1,sv0},in,out);
#160 $finish;
end

always #10 begin sim_obj.upd_sv0(); sv0=sim_obj.sv0c; end
always #20 begin sim_obj.upd_sv1(); sv1=sim_obj.sv1c; end
always #40 begin sim_obj.upd_lr();  l_r=sim_obj.l_rc; end
always #80 begin sim_obj.upd_rot(); rot=sim_obj.rotc; end

endmodule
