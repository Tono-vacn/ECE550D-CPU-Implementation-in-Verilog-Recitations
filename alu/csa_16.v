module csa_16(a,b,cin,sum,cout);

	input [15:0] a,b;
	input cin;
	output[15:0] sum;
	output cout;
	
	wire cho,cout_0,cout_1;
	wire [7:0] res_0,res_1;
	
	rca_8 r0(a[7:0],b[7:0],cin,sum[7:0],cho);
	rca_8 r1_0(a[15:8],b[15:8],1'b0,res_0[7:0],cout_0);
	rca_8 r1_1(a[15:8],b[15:8],1'b1,res_1[7:0],cout_1);
	
	mux s_cout(cout_1,cout_0,cho,cout);
	mux_8 s_sum(res_1,res_0,cho,sum[15:8]);
	

endmodule

module csa_16_overflow(a,b,cin,sum,cout,of);

	input [15:0] a,b;
	input cin;
	output[15:0] sum;
	output cout,of;
	
	wire cho,cout_0,cout_1,of_0,of_1;
	wire [7:0] res_0,res_1;
	
	rca_8 r0(a[7:0],b[7:0],cin,sum[7:0],cho);
	rca_8_overflow r1_0(a[15:8],b[15:8],1'b0,res_0[7:0],cout_0,of_0);
	rca_8_overflow r1_1(a[15:8],b[15:8],1'b1,res_1[7:0],cout_1,of_1);
	
	mux s_cout(cout_1,cout_0,cho,cout);
	mux s_of(of_1,of_0,cho,of);
	mux_8 s_sum(res_1,res_0,cho,sum[15:8]);
	

endmodule