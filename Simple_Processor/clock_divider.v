module clock_divider(div_clock, clk, rst);
	
	input clk, rst;
	output reg div_clock;
	
	always @(posedge clk or posedge rst) 
	begin
	if (~rst)
		div_clock <= 1'b0;
	else
		div_clock <= ~div_clock;
	end
	
endmodule

module clk_dffe(clk,reset,out,out_);

	input clk,reset;
	output out,out_;

	//module dffe_reg(q, d, clk, en, clr);
	dffe_reg dff_ins(out,~out,clk,1'b1,reset);
	assign out_ = ~out;

endmodule