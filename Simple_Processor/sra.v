module sra(a,ctrl_shiftamt,shift_out);
	input[31:0]a;
	input [4:0]ctrl_shiftamt;
	output[31:0]shift_out;
	
	wire[31:0]res[0:3];
	
	mux mx0(a[31],a[31],ctrl_shiftamt[0],res[0][0]);
	
	generate
		genvar i,j;
		for(i=1;i<32;i=i+1) begin: loop_sra_0
			mux mx1(a[32-i],a[31-i],ctrl_shiftamt[0],res[0][i]);
		end
		
		for(j=1;j<4;j=j+1) begin: loop_j
			for(i=0;i<2**j;i=i+1) begin: loop_sra_1_0
				mux mx2(a[31],res[j-1][i],ctrl_shiftamt[j],res[j][i]);
			end
			for(i=2**j;i<32;i=i+1) begin: loop_sra_1_1
				mux mx3(res[j-1][i-2**j],res[j-1][i],ctrl_shiftamt[j],res[j][i]);
			end
		
		end
		
//		for(i=0;i<2;i=i+1) begin: loop_sll_1_0
//			mux mx2(1'b0,res[0][i],ctrl_shiftamt[1],res[1][i]);
//		end
//		for(i=2;i<32;i=i+1) begin: loop_sll_1_1
//			mux mx3(res[0][i-2],res[0][i],ctrl_shiftamt[1],res[1][i]);
//		end
//		
//		for(i=0;i<4;i=i+1) begin: loop_sll_2_0
//			mux mx4(1'b0,res[1][i],ctrl_shiftamt[2],res[2][i]);
//		end
//		for(i=4;i<32;i=i+1) begin: loop_sll_2_1
//			mux mx5(res[1][i-4],res[1][i],ctrl_shiftamt[2],res[2][i]);
//		end
//		
//		for(i=0;i<8;i=i+1) begin: loop_sll_3_0
//			mux mx6(1'b0,res[2][i],ctrl_shiftamt[3],res[3][i]);
//		end
//		for(i=8;i<32;i=i+1) begin: loop_sll_3_1
//			mux mx7(res[2][i-8],res[2][i],ctrl_shiftamt[3],res[3][i]);
//		end
		
		
		
		
		for(i=0;i<16;i=i+1) begin: loop_sll_4_0
			mux mx6(a[31],res[3][i],ctrl_shiftamt[4],shift_out[31-i]);
		end
		for(i=16;i<32;i=i+1) begin: loop_sll_4_1
			mux mx7(res[3][i-16],res[3][i],ctrl_shiftamt[4],shift_out[31-i]);
		end
		
	endgenerate
	
	
endmodule