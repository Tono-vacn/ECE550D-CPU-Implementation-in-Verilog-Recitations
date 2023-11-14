module pc_4(address_imem, res);
	input [11:0] address_imem;
	output [11:0] res;
	wire c_out;
	rca_12 add4(address_imem,12'd1,1'b0,c_out,res);
endmodule
