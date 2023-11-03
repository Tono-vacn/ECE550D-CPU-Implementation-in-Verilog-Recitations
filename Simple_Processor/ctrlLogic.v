module ctrlLogic(
q_imem, 
is_imm, 
ctrl_RegWE,
//Reg_en, 
has_B,ALUopcode, wren, is_WB, pc_out, Brneq,Brlt,Ab_out,setx,bex,
jal,swtch
);
	input [31:0] q_imem;
	input Brneq,Brlt;
	output is_imm, has_B, wren,jal,bex,setx,ctrl_RegWE, pc_out, Ab_out, swtch;
	output [1:0] is_WB;
	output[4:0] ALUopcode;
	
	//new part
	
	wire jt,lw,add_sign,bne,jr,blt,addi;
	
	and a0(add_sign,~q_imem[31],~q_imem[30],~q_imem[29],~q_imem[28],~q_imem[27]);
	and a1(addi,~q_imem[31],~q_imem[30],q_imem[29],~q_imem[28],q_imem[27]);
	and a2(wren,~q_imem[31],~q_imem[30],q_imem[29],q_imem[28],q_imem[27]);
	and a3(lw,~q_imem[31], q_imem[30], ~q_imem[29], ~q_imem[28], ~q_imem[27]);
	and a4(jt, ~q_imem[31], ~q_imem[30], ~q_imem[29], ~q_imem[28], q_imem[27]);
	and a5(bne, ~q_imem[31], ~q_imem[30], ~q_imem[29], q_imem[28], ~q_imem[27]);
	and a6(jal, ~q_imem[31], ~q_imem[30], ~q_imem[29], q_imem[28], q_imem[27]);
	and a7(jr, ~q_imem[31], ~q_imem[30], q_imem[29], ~q_imem[28], ~q_imem[27]);
	and a8(blt, ~q_imem[31], ~q_imem[30], q_imem[29], q_imem[28], ~q_imem[27]); // blt[8]
	and a9(bex, q_imem[31], ~q_imem[30], q_imem[29], q_imem[28], ~q_imem[27]); // bex[9]
	and a10(setx, q_imem[31], ~q_imem[30], q_imem[29], ~q_imem[28], q_imem[27]);
	
	assign is_imm = ~add_sign;
	or reg_wren(ctrl_RegWE,add_sign,addi,lw,jal,setx);
	
	//wire has_B
	or getB(has_B,add_sign,jr);// 1 for have B
	assign ALUopcode = add_sign?q_imem[6:2]:5'b00000;
	
	
	//assign wren = q_imem[28];
	assign is_WB[1] = jal;
	or WB0(is_WB[0],add_sign,addi,setx);
	
	wire pcj,pcbej,not_e;
	or or_pcj(pcj,jt,jal,jr);
	or or_eq(not_e,bex,bne);
	assign pcbej = not_e?Brneq:pcj;
	assign pc_out = blt?Brlt:pcbej;
	
	or or_A(Ab_out,bne,blt);
	or or_swtch(swtch,wren,bne,jr,blt);
	
	//assign is_WB = q_imem[30];
	//assign is_imm = q_imem[16];
	
	//assign Reg_en = ~q_imem[28];
	//or getB(has_B,q_imem[31],q_imem[30],q_imem[29],q_imem[28], q_imem[27]);
	//assign ALUopcode = has_B?5'b00000:q_imem[6:2];

	
endmodule


//module ctrlLogic(
//q_imem, is_imm, Reg_en, has_B,
//ALUopcode, wren, is_WB
//);
//	input [31:0] q_imem;
//	output is_imm, Reg_en, has_B, wren, is_WB;
//	output[4:0] ALUopcode;
//	
//	assign wren = q_imem[28];
//	assign is_WB = q_imem[30];
//	assign is_imm = q_imem[16];
//	assign Reg_en = ~q_imem[28];
//	or getB(has_B,q_imem[31],q_imem[30],q_imem[29],q_imem[28], q_imem[27]);
//	assign ALUopcode = has_B?5'b00000:q_imem[6:2];
//
//	
//endmodule


