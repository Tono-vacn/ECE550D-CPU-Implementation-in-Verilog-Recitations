module reg_32(q, d, clk, en, clr);
	input [31:0] d;
	input clk,clr,en;
	output [31:0] q;
	genvar i;
	generate
		for(i=0;i<32;i=i+1) begin: reg_loop
			dffe_reg df(q[i],d[i],clk,en,clr);
		end
	endgenerate
endmodule

module reg_12(q, d, clk, en, clr);
	input [11:0] d;
	input clk,clr,en;
	output [11:0] q;
	genvar i;
	generate
		for(i=0;i<12;i=i+1) begin: reg_loop_12
			dffe_reg df(q[i],d[i],clk,en,clr);
		end
	endgenerate
endmodule