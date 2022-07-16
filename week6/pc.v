module fa (input wire i0, i1, cin, output wire sum, cout);
   wire t0, t1, t2;
   xor3 _i0 (i0, i1, cin, sum);
   and2 _i1 (i0, i1, t0);
   and2 _i2 (i1, cin, t1);
   and2 _i3 (cin, i0, t2);
   or3 _i4 (t0, t1, t2, cout);
endmodule

module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);
  wire t;
  fa _i0 (i0, t, cin, sumdiff, cout);
  xor2 _i1 (i1, addsub, t);
endmodule

module pc_slice_0 (input wire clk,reset,inc,add,sub,offset,output wire pc,cout);
wire x,y,z;
or3 o1(inc,add,sub,z);
or2 o(offset,inc,x);
addsub a1( x,sub,sub,pc,y,cout);
dfrl d1(clk,reset,z,y,pc);
endmodule

module pc_slice(input wire clk,reset,inc,add,sub,offset,out,output wire pc,cout);
wire x,y,z,k;
or3 o1(inc,add,sub,z);
invert i1(inc,k);
and2 a(offset,k,x);
addsub a1( x,sub,out,pc,y,cout);
dfrl d1(clk,reset,z,y,pc);
endmodule

module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);
wire out[15:0];
pc_slice_0 s0(clk,reset,inc,add,sub,offset[0],pc[0],out[0]);
pc_slice s1 (clk,reset,inc,add,sub,offset[1],out[0],pc[1],out[1]);
pc_slice s2 (clk,reset,inc,add,sub,offset[2],out[1],pc[2],out[2]);
pc_slice s3 (clk,reset,inc,add,sub,offset[3],out[2],pc[3],out[3]);
pc_slice s4 (clk,reset,inc,add,sub,offset[4],out[3],pc[4],out[4]);
pc_slice s5 (clk,reset,inc,add,sub,offset[5],out[4],pc[5],out[5]);
pc_slice s6 (clk,reset,inc,add,sub,offset[6],out[5],pc[6],out[6]);
pc_slice s7 (clk,reset,inc,add,sub,offset[7],out[6],pc[7],out[7]);
pc_slice s8 (clk,reset,inc,add,sub,offset[8],out[7],pc[8],out[8]);
pc_slice s9 (clk,reset,inc,add,sub,offset[9],out[8],pc[9],out[9]);
pc_slice s10 (clk,reset,inc,add,sub,offset[10],out[9],pc[10],out[10]);
pc_slice s11 (clk,reset,inc,add,sub,offset[11],out[10],pc[11],out[11]);
pc_slice s12 (clk,reset,inc,add,sub,offset[12],out[11],pc[12],out[12]);
pc_slice s13 (clk,reset,inc,add,sub,offset[13],out[12],pc[13],out[13]);
pc_slice s14 (clk,reset,inc,add,sub,offset[14],out[13],pc[14],out[14]);
pc_slice s15 (clk,reset,inc,add,sub,offset[15],out[14],pc[15],out[15]);
endmodule
