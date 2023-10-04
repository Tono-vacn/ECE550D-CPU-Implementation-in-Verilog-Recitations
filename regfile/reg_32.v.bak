module reg_32(q, d, clk, en, clr);
	input [31:0] d;
	input clk,clr,en;
	output [31:0] q;
	genvar i;
	generate
		for(i=0;i<32;i=i+1) begin: reg_loop
			dffe_ref df(q[i],d[i],clk,en,clr);
		end
	endgenerate
endmodule
