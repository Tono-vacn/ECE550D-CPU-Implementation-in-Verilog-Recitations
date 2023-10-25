module ctrlLogic(
q_imem, is_imm, Reg_en, has_B,
ALUopcode, wren, is_WB
);
	input [31:0] q_imem;
	output is_imm, Reg_en, has_B, wren, is_WB;
	output[4:0] ALUopcode;
	
	assign wren = q_imem[28];
	assign is_WB = q_imem[30];
	assign is_imm = q_imem[16];
	assign Reg_en = ~q_imem[28];
	or getB(has_B,q_imem[31],q_imem[30],q_imem[29],q_imem[28], q_imem[27]);
	assign ALUopcode = has_B?5'b00000:q_imem[6:2];

	
endmodule
