module ctrlLogic(
q_imem, 
is_imm, 
ctrl_RegWE,
//Reg_en, 
has_B,ALUopcode, wren, is_WB, setx,bex,
jal,jt,bne,jr,blt//, pc_out ,Ab_out,swtch,Brneq,Brlt,
);
	input [31:0] q_imem;
	//input Brneq,Brlt;
	output is_imm, has_B, wren,jal,bex,setx,ctrl_RegWE,jt,bne,jr,blt,is_WB;//, pc_out, Ab_out, swtch
	//output [1:0] is_WB;
	output[4:0] ALUopcode;
	
	//new part
	
	wire lw,add_sign,addi;//,bne,jr,blt,jt,
	
	and a0(add_sign,~q_imem[31],~q_imem[30],~q_imem[29],~q_imem[28],~q_imem[27]);
	and a1(addi,~q_imem[31],~q_imem[30],q_imem[29],~q_imem[28],q_imem[27]);
	and a2(wren,~q_imem[31],~q_imem[30],q_imem[29],q_imem[28],q_imem[27]);
	and a3(lw,~q_imem[31], q_imem[30], ~q_imem[29], ~q_imem[28], ~q_imem[27]);
	and a4(jt, ~q_imem[31], ~q_imem[30], ~q_imem[29], ~q_imem[28], q_imem[27]);
	and a5(bne, ~q_imem[31], ~q_imem[30], ~q_imem[29], q_imem[28], ~q_imem[27]);
	and a6(jal, ~q_imem[31], ~q_imem[30], ~q_imem[29], q_imem[28], q_imem[27]);
	and a7(jr, ~q_imem[31], ~q_imem[30], q_imem[29], ~q_imem[28], ~q_imem[27]);
	and a8(blt, ~q_imem[31], ~q_imem[30], q_imem[29], q_imem[28], ~q_imem[27]);
	and a9(bex, q_imem[31], ~q_imem[30], q_imem[29], q_imem[28], ~q_imem[27]);
	and a10(setx, q_imem[31], ~q_imem[30], q_imem[29], ~q_imem[28], q_imem[27]);
	
	assign is_imm = ~add_sign;
	or reg_wren(ctrl_RegWE,add_sign,addi,lw,jal,setx);
	
	//wire has_B
   or getB(has_B,add_sign,jr);// 1 for have B
	assign ALUopcode = add_sign?q_imem[6:2]:5'b00000;
	
	or WB0(is_WB,add_sign,addi,setx);
	
endmodule



