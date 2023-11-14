module brgen(data_readRegA,data_readRegB,Brneq,Brlt);
	input [31:0] data_readRegA,data_readRegB;
	output Brneq,Brlt;

	wire [31:0] data_res;
	//wire [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	wire isNotEqual, isLessThan, overflow;
	alu getb(data_readRegA, data_readRegB, 5'b00000,5'b00000, data_res, Brneq, Brlt, overflow);

//	and a0(Brneq,isNotEqual,1'b1);
//	assign Brneq = isNotEqual?1'b1:1'b0;
//	assign Brlt = isLessThan?1'b1:1'b0;
//	and a1(Brlt,isLessThan,1'b1);

endmodule