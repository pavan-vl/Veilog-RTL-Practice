//Designed by Pavan V L
//Full subtractor using 2 half subtractors
module fs_hs(a,b,bin,d,bo);
input a,b,bin;
output d,bo;

wire hs1_diff, hs1_bo, hs2_bo, borrow_total;

hs hs_inst1(.a(a), .b(b), .d(hs1_diff), .bo(hs1_bo));
hs hs_inst2(.a(hs1_diff), .b(bin) , .d(d) , .bo(hs2_bo));
or or_inst(bo,hs1_bo,hs2_bo);

endmodule