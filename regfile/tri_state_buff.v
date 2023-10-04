module tri_state_buff(in,out,ctrl);
	input ctrl;
	input [31:0] in;
	output [31:0] out;
	generate
		genvar i;
		for (i=0;i<32;i=i+1) begin: loop_tri
			assign out[i]=ctrl?in[i]:1'bz;
		end
	endgenerate
	

endmodule
