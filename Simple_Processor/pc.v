module pc(d,clk,rst,en,q,q_p);
	input [31:0] d;
	input clk,rst,en;
	output [31:0] q;
	output [31:0] q_p;
	wire [31:0] d_reg;//, next_val;
	
//	initial begin
//		q<=0;
//		q_p<=0;
//	end

	//assign next_val = en?d:d_reg;
	reg_32 q_reg(d_reg,d,clk,en,rst);
	assign q_p = d_reg?d_reg+1:0;
	assign q = d_reg;
	
	
endmodule

module pc_calc(d, q, isJ, isB, bType, bI, jI, isJR, rd);
	input [31:0] d, rd;
	input isJ, isB, bType, isJR;
	input [31:0] bI;
	input [26:0] jI;
	output [31:0] q;
	wire [31:0] jI_32;
	assign jI_32[26:0] = jI;
	assign q = isJ ? (isJR ? rd : jI_32) : ((bType && isB) ? (d + bI) : d); 
		
endmodule

module pc_4(address_imem, res);
	input [11:0] address_imem;
	output [11:0] res;
	wire c_out;
	rca_12 add4(address_imem,12'd1,1'b0,c_out,res);
endmodule
