module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire flag_as,cout;//,of;
	wire [31:0]data_operandB_flipped,sll_result,csa_result,sra_result;
	//wire 
	assign flag_as = ctrl_ALUopcode[0];
	
	xor_32_1 flipB(data_operandB,flag_as,data_operandB_flipped);
	
	//csa_32 csa_add_sub(data_operandA,data_operandB_flipped, flag_as, csa_result, cout, overflow);
	csa_32 csa_add_sub(data_operandA,data_operandB_flipped, flag_as, data_result, cout, overflow);
	
	sll sll_res(data_operandA,ctrl_shiftamt, sll_result);
	sra sra_res(data_operandA,ctrl_shiftamt, sra_result);
	
	zero_det zero_check(csa_result, isNotEqual);
	assign isLessThan = overflow?data_operandA[31]:csa_result[31];
	
endmodule
