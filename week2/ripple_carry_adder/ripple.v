module full(input wire a,b,c, output wire sum,carry);
	assign sum=a^b^c;
	assign carry =a&b+b&c+c&a;
endmodule

module 
fulladdR(input wire [0:3]i0,i1,input wire cin, output wire [0:3]o,output wire cout);

   // Instantiate full adder modules here.
	wire [2:0] c;
	full f1(i0[0],i1[0],cin, o[0],c[0]);
	full f2(i0[1],i1[1],c[0], o[1],c[1]);
	full f3(i0[2],i1[2],c[1], o[2],c[2]);
	full f4(i0[3],i1[3],c[2], o[3],cout);


endmodule 

