module csa_32(a,b,cin,sum,cout,of);
	input [31:0] a,b;
	input cin;
	output [31:0]sum;
	output cout,of;
	
	wire cho,cout_0,cout_1,of_0,of_1;
	wire [15:0] res_0,res_1;
	
	csa_16 c0(a[15:0],b[15:0],cin,sum[15:0],cho);
	csa_16_overflow c1_0(a[31:16],b[31:16],1'b0,res_0[15:0],cout_0,of_0);
	csa_16_overflow c1_1(a[31:16],b[31:16],1'b1,res_1[15:0],cout_1,of_1);
	
	mux s_cout(cout_1,cout_0,cho,cout);
	mux s_of(of_1,of_0,cho,of);
	mux_16 s_sum(res_1,res_0,cho,sum[31:16]);
	
endmodule


