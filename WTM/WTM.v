

module FA(
	input A,B, Cin,
	output Sum,Cout
);

	wire sum1, c1, c2;
   HA HA1 (
        .a(A),
        .b(B),
        .sum(sum1),
        .carry(c1)
    );
	 
	 HA HA2 (.a(sum1),
			.b(Cin),
        .sum(Sum),
        .carry(c2)
    );
	 
//	 or or1 (
//        .a(c1),
//        .b(c2),
//        .y(Cout)
//    );
	 	 or or1 (Cout,c1,c2);
	
endmodule


module HA (a, b, sum, carry);
	input a,b;

	output sum,carry;

	 
	xor xor1 (sum,a,b);

   and and1 (carry,a,b);

endmodule

module WTM(
	input [4:0] A,B,
	output [9:0] P
);
	wire [4:0] pp[4:0];
	wire [9:0] reduced;
	wire ha1_sum, ha1_cout;
	wire ha2_sum, ha2_cout;
	wire ha3_sum, ha3_cout;
	wire ha4_sum, ha4_cout;
	wire ha5_sum, ha5_cout;
	wire fa1_sum, fa1_cout;
	wire fa2_sum, fa2_cout;
	wire fa3_sum, fa3_cout;
	wire fa4_sum, fa4_cout;
	wire fa5_sum, fa5_cout;
	wire fa6_sum, fa6_cout;
	wire fa7_sum, fa7_cout;
	wire fa8_sum, fa8_cout;
	wire fa9_sum, fa9_cout;
	wire fa10_sum, fa10_cout;
	wire fa11_sum, fa11_cout;
	wire fa12_sum, fa12_cout;
	wire fa13_sum, fa13_cout;
	wire fa14_sum, fa14_cout;
	wire fa15_sum, fa15_cout;
	
//	genvar i ;
//	genvar j ;
//generate
//    for (i = 0; i < 5; i=i+1) begin : loop_i
//        for (j = 0; j < 5; j=j+1) begin : loop_j
//            if (i == 0 && j == 0) begin: case_0_0
//                and and_gate_inst (A[0], B[0], P[0]);
//            end else begin: case_other
//                and and_gate_inst (A[i], B[j], pp[i][j]);
//            end
//        end
//    end
//endgenerate
	and(P[0],A[0],B[0]);
	//stage 1
	//a1b0+a0b1
	HA ha1(A[0]&B[1],A[1]&B[0],P[1],ha1_cout);
	//a2b0+a1b1+a0b2
	FA fa1(A[2]&B[0],A[1]&B[1],A[0]&B[2],fa1_sum,fa1_cout);
	//a3b0+a2b1+a1b2
	FA fa2(A[3]&B[0],A[2]&B[1],A[1]&B[2],fa2_sum,fa2_cout);
	//a4b0+a3b1+a2b2
	FA fa3(A[4]&B[0],A[3]&B[1],A[2]&B[2],fa3_sum,fa3_cout);
	//a4b1+a3b2
	HA ha2(A[4]&B[1],A[3]&B[2],ha2_sum,ha2_cout);
	
	//stage 2
	HA ha3(fa1_sum, ha1_cout,P[2],ha3_cout);
	FA fa4(A[0]&B[3],fa2_sum,fa1_cout,fa4_sum,fa4_cout);
	FA fa5(A[1]&B[3],fa3_sum,fa2_cout,fa5_sum,fa5_cout);
	FA fa6(A[2]&B[3],ha2_sum,fa3_cout,fa6_sum,fa6_cout);
	FA fa7(A[4]&B[2],A[3]&B[3],ha2_cout,fa7_sum,fa7_cout);
	
	//stage 3
	
	HA ha4(fa4_sum,ha3_cout,P[3],ha4_cout);
	FA fa8(A[0]&B[4],fa5_sum,fa4_cout,fa8_sum,fa8_cout);
	FA fa9(A[1]&B[4],fa6_sum,fa5_cout,fa9_sum,fa9_cout);
	FA fa10(A[2]&B[4],fa7_sum,fa6_cout,fa10_sum,fa10_cout);
	FA fa11(A[4]&B[3],A[3]&B[4],fa7_cout,fa11_sum,fa11_cout);
	
	//stage 4
	HA ha5(fa8_sum,ha4_cout,P[4],ha5_cout);
	FA fa12(fa9_sum,fa8_cout,ha5_cout,P[5],fa12_cout);
	FA fa13(fa10_sum,fa9_cout,fa12_cout,P[6],fa13_cout);
	FA fa14(fa11_sum,fa10_cout,fa13_cout,P[7],fa14_cout);
	FA fa15(A[4]&B[4],fa11_cout,fa14_cout,P[8],P[9]);
	
	
	
	
	//P[0] <= pp[0][0];
//	assign P[1] = ha1_sum;
//	assign P[2] = ha3_sum;
//	assign P[3] = ha4_sum;
//	assign P[4] = ha5_sum;
//	assign P[5] = fa12_sum;
//	assign P[6] = fa13_sum;
//	assign P[7] = fa14_sum;
//	assign P[8] = fa15_sum;
//	assign P[9] = fa15_cout;
//	
//	assign P = {fa}

endmodule






