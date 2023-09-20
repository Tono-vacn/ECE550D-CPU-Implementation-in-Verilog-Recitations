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
