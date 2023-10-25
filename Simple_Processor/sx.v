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

//module sx_(q_imem,is_Imm,out);
//
//input  [16:0] q_imem;
//input  is_Imm;
//output [31:0] out;
//
////reg ext[14:0];
//assign out[31:17]=is_Imm? 15'b111111111111111:15'b0;
//assign out[16:0]= q_imem[16:0];
//
//
//endmodule
