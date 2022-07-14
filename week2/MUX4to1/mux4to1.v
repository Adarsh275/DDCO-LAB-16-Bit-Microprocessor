module mux2(input wire i0,i1,j, output wire o);
	assign o= (j==0)?i0:i1;
endmodule


module mux4(input wire [0:3]i,input wire j0,j1, output wire o);
	wire t1,t2;
	mux2 m1(i[0],i[1],j1,t1);
	mux2 m2(i[2],i[3],j1,t2);
	mux2 m3(t1,t2,j0,o);
endmodule


