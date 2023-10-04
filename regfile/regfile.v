module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	
	wire [31:0] wrt, reg_en, tri_en_1, tri_en_2;
	wire [31:0] reg_out[31:0];
	
	decoder_5_32 wr_selector(ctrl_writeReg, wrt);
	decoder_5_32 rd_selector_A(ctrl_readRegA, tri_en_1);
	decoder_5_32 rd_selector_B(ctrl_readRegB, tri_en_2);
	and wr0(reg_en[0],1'b0,wrt[0]);
	
	generate
		genvar i,j;
		for (j=1;j<32;j=j+1) begin: loop_wr
			and and_wr(reg_en[j],ctrl_writeEnable,wrt[j]);
		end
		
		for(i=0;i<32;i=i+1) begin:loop_1
			reg_32 regs(reg_out[i],data_writeReg,clock,reg_en[i],ctrl_reset);
			tri_state_buff triA(reg_out[i],data_readRegA,tri_en_1[i]);
			tri_state_buff triB(reg_out[i],data_readRegB, tri_en_2[i]);
		end
	endgenerate
	
	

endmodule
