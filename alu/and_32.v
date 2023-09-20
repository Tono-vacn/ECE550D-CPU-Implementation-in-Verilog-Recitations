module and_32(a,b,out);
	input [31:0]a,b;
	output [31:0]out;
	

		generate
			genvar i;
			for(i=0;i<32;i=i+1) begin:loop_1
				and and_instance(out[i],a[i],b[i]);
			end
		endgenerate
endmodule
