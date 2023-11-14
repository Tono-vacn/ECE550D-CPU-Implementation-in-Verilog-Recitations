module sx(in, out);
	input [16:0] in;
	output [31:0] out;
	assign out[16:0] = in;
	generate
		genvar i;
		for (i = 17; i < 32; i = i + 1) begin:loop
			assign out[i] = in[16];
		end
	endgenerate
endmodule

