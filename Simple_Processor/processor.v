/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 wire isNotEqual, isLessThan, overflow, is_imm, has_B, is_WB, Reg_en;
	 //wire is_J, is_B, is_JR, bType;
	 wire[31:0] imme_sx, ALU_dataB, ALU_res, ALU_res_final, of_j, of_r;
	 
	 wire [4:0] ALUopcode;
	 wire [11:0] pc_mid_res;
	 //wire [16:0] imm;
	 
	 // pc + '4'
	 
	 pc_4 getpc(address_imem,pc_mid_res);
	 reg_12 pc(address_imem, pc_mid_res,clock,1'b1,reset);
	 
	 ctrlLogic getcode(q_imem,is_imm, ctrl_writeEnable, has_B, ALUopcode, wren, is_WB);
	 
	 //generate for sign extension, pick right ALU data B
	 
	 sx sx_sx(q_imem[16:0],imme_sx);
	 
	 assign ALU_dataB = has_B?imme_sx:data_readRegB;
	 
	 alu a_alu(data_readRegA,ALU_dataB,ALUopcode,q_imem[11:7],ALU_res,isNotEqual, isLessThan, overflow);
	 
	 
	 assign data = data_readRegB;
	 assign address_dmem = ALU_res[11:0];
	 
//	 wire addi_of;
//	 assign addi_of = ~q_imem[31] & ~q_imem[30] & q_imem[29] & ~q_imem[28] & q_imem[27] & overflow;
	 
	 
	 // get info for regfile	 
	 assign ctrl_writeReg = overflow?5'd30:q_imem[26:22];
//	 assign ctrl_writeReg = addi_of?5'd30:q_imem[26:22];
	 assign ctrl_readRegA = q_imem[21:17];
	 assign ctrl_readRegB = wren?q_imem[26:22]:q_imem[16:12];
	 
	 
	 
	 
	

	 
//	 assign of_j = q_imem[2]?32'd3:32'd1; 
//	 assign of_r = q_imem[29]?32'd2:of_j;

//	 assign ALU_res_final = overflow? of_r:ALU_res;


//check the overflow result and pick the right result to write

	assign ALU_res_final = overflow? (q_imem[29]?32'd2:(q_imem[2]?32'd3:32'd1)):ALU_res;

//    assign ALU_res_final = addi_of? 32'd2:ALU_res;
	 assign data_writeReg = is_WB?q_dmem:ALU_res_final;
	 //assign is_J=opcode==


endmodule