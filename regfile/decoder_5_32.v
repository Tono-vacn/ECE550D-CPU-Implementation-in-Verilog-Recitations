module decoder_5_32(in,out);
	input [4:0] in;
	output [31:0] out;
	and and0(out[0],~in[4],~in[3],~in[2],~in[1],~in[0]);
	and and1(out[1],~in[4],~in[3],~in[2],~in[1],in[0]);
	and and2(out[2],~in[4],~in[3],~in[2],in[1],~in[0]);
	and and3(out[3],~in[4],~in[3],~in[2],in[1],in[0]);
	and and4(out[4],~in[4],~in[3],in[2],~in[1],~in[0]);
	and and5(out[5],~in[4],~in[3],in[2],~in[1],in[0]);
	and and6(out[6],~in[4],~in[3],in[2],in[1],~in[0]);
	and and7(out[7],~in[4],~in[3],in[2],in[1],in[0]);
	
	and   and8(out[8],~in[4],in[3],~in[2],~in[1],~in[0]);
	and   and9(out[9],~in[4],in[3],~in[2],~in[1],in[0]);
	and and10(out[10],~in[4],in[3],~in[2],in[1],~in[0]);
	and and11(out[11],~in[4],in[3],~in[2],in[1],in[0]);
	and and12(out[12],~in[4],in[3],in[2],~in[1],~in[0]);
	and and13(out[13],~in[4],in[3],in[2],~in[1],in[0]);
	and and14(out[14],~in[4],in[3],in[2],in[1],~in[0]);
	and and15(out[15],~in[4],in[3],in[2],in[1],in[0]);
	
	and and16(out[16],in[4],~in[3],~in[2],~in[1],~in[0]);
	and and17(out[17],in[4],~in[3],~in[2],~in[1],in[0]);
	and and18(out[18],in[4],~in[3],~in[2],in[1],~in[0]);
	and and19(out[19],in[4],~in[3],~in[2],in[1],in[0]);
	and and20(out[20],in[4],~in[3],in[2],~in[1],~in[0]);
	and and21(out[21],in[4],~in[3],in[2],~in[1],in[0]);
	and and22(out[22],in[4],~in[3],in[2],in[1],~in[0]);
	and and23(out[23],in[4],~in[3],in[2],in[1],in[0]);
	
	and and24(out[24],in[4],in[3],~in[2],~in[1],~in[0]);
	and and25(out[25],in[4],in[3],~in[2],~in[1],in[0]);
	and and26(out[26],in[4],in[3],~in[2],in[1],~in[0]);
	and and27(out[27],in[4],in[3],~in[2],in[1],in[0]);
	and and28(out[28],in[4],in[3],in[2],~in[1],~in[0]);
	and and29(out[29],in[4],in[3],in[2],~in[1],in[0]);
	and and30(out[30],in[4],in[3],in[2],in[1],~in[0]);
	and and31(out[31],in[4],in[3],in[2],in[1],in[0]);
	endmodule
