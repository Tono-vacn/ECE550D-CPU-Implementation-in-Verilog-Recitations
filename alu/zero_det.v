module zero_det(in,out);
	input [31:0] in;
	output out;
	wire [1:0] w;
	or_16 or_16_0(in[15:0],w[0]);
	or_16 or_16_1(in[31:16],w[1]);
	or or_0(out,w[0],w[1]);
endmodule

module or_16(in,out);
	input [15:0] in;
	output out;
	wire [1:0] w;
	or_8 or_8_0(in[7:0],w[0]);
	or_8 or_8_1(in[15:8],w[1]);
	or or_0(out,w[0],w[1]);
endmodule

module or_8(in,out);
	input [7:0] in;
	output out;
	wire [1:0] w;
	or_4 or_4_0(in[3:0],w[0]);
	or_4 or_4_1(in[7:4],w[1]);
	or or_0(out,w[0],w[1]);
endmodule

module or_4(in,out);
	input[3:0]in;
	wire [1:0] w;
	output out;
	generate
	genvar i;
		for (i=0;i<2;i=i+1) begin: or_4
			or or_i4(w[i],in[i+i],in[i+i+1]);
		end
	endgenerate
	or or_i5(out,w[0],w[1]);
endmodule
