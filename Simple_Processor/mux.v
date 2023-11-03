module mux(a,b,s,out);
	input a,b,s;
	output out;
	assign out = s?a:b;
endmodule

module mux_8(a,b,s,out);
	input [7:0]a,b;
	input s;
	output [7:0]out;
	assign out = s?a:b; 
endmodule

module mux_16(a,b,s,out);
	input [15:0]a,b;
	input s;
	output [15:0]out;
	assign out = s?a:b; 
endmodule

module mux_32(a,b,s,out);
	input [31:0]a,b;
	input s;
	output [31:0]out;
	assign out = s?a:b; 
endmodule

module mux_32_5(and_,or_,sll_,sra_,as,s,out);
	input [31:0] and_,or_,sll_,sra_,as;
	input [4:0] s;
	output [31:0] out;
	wire [31:0] and_or,sll_sra;
	mux_32 from_and_or(or_,and_,s[0],and_or);
	mux_32 from_sll_sra(sra_,sll_,s[0],sll_sra);
	assign out = s[2]?sll_sra:(s[1]?and_or:as);
endmodule

module MUX41(out,in0,in1,in2,in3,s);
	input [1:0] s;
	input [31:0] in0, in1, in2, in3;
	output [31:0] out;
	wire [31:0] w1, w2;

	MUX2 m0(w1,in0,in1,s[0]);
	MUX2 m1(w2,in2,in3,s[0]);
	MUX2 m2(out,w1,w2,s[1]);

endmodule

module MUX2(X, A0, A1, S);
   //parameter WIDTH=32;     // How many bits wide are the lines

   output [31:0] X;   // The output line

   input [31:0]  A1;  // Input line with id 1'b1
   input [31:0]  A0;  // Input line with id 1'b0
   input 	      S;  // Selection bit
   
   assign X = S?A1:A0;
endmodule // multiplexer_2_1