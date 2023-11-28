# Name: Yuchen Jiang, Shujie Yang

## Details
**Name**: Yuchen Jiang, Shujie Yang  
**netID**: yj210, sy289


## Description
This is a full processor capable of handling R-type, I-type and J-type instructions. The design captures the essential components of a processor, such as the program counter, instruction decoding logic, arithmetic logic unit (ALU), memory interfacing, and register file operations, ensuring a comprehensive approach to those instructions processing.

Based on the previous checkpoint, there are some new adaptation added due to the J-type instruction. 

### control logic module
ctrlLogic module decodes the control signals from the 32-bit instruction q_imem by a series of AND gates.  In addition to handling R-type and I-type instructions, ctrlLogic also handles branching and jumping logic. Whenever an ALU operation (except addi) or an jr operation exists, the has_B signal will be 1, indicating the presence of the data operand B. 

### ALU operation
For ALU data B, using has_B signal to choose between read register B and immediate value is sufficient. For data A, it is needed to firstly generate a signal Ab_out, which is indicating the presence of bne and blt. If any one of them exists, address from imem should be chosen as data A. After the ALU computation, we extract first 12 bits of the ALU results as the address of the dmem.

### overflow handling
If there are ALU operations exists, including add, addi, sub and so on, we need to handle the overflow. And we need to assign $rstatus different value for the different instructions, judging from q_imem.

### data write Register
In control logic module, we return "is_WB" signal, which is true when ALU operation and setx exists. When jal is true, the data_writeReg should be set to the 32-bit address from imem; when there's no jal instruction, we need to see "is_WB" to decide whether to choose result from ALU or the data from dmem.

### register to write and read
Then we need to decide next PC value by first decide pc_out signal, then choose from 12_bit ALU result and pc+4 address. 

Register to write to in regfile is set to the appropriate register when setx and jal signal are exist. Also we need to write to $rstatus when overflow exists.

Next, use sw, ,bne, j and blt instruction to indicate swtch signal, and this could help us determine ctrl_readRegB. If swtch is true, ctrl_readRegB is set to be $rd, otherwise is set to $rt. If bex exists, we need to set it to $30.

Finally, we use setx to determine ctrl_readRegA. If setx is true, it is set to $0, otherwise it is set to be $rs.