# Name: Yuchen Jiang, Shujie Yang

## Details
**Name**: Yuchen Jiang, Shujie Yang  
**netID**: yj210, sy289


## Description
This is a simple processor capable of handling R-type and I-type instructions. The design captures the essential components of a processor, such as the program counter, instruction decoding logic, arithmetic logic unit (ALU), memory interfacing, and register file operations, ensuring a comprehensive approach to those instructions processing.

### clock divider based on dffe
We utilize clk_dffe module to be the clock divider. It delayed by one cycle based on its value in the previous clock cycle.

### pc
Module pc_4 add 1 to the 12-bit input address to get the output address. 

### Control Logic
ctrlLogic module decodes the control signals from the 32-bit instruction q_imem, which include the presence or absence of an immediate number, a register enable, the presence or absence of a 1 in the highest five bits of the instruction, the opcode of the ALU, the write enable, and flags related to the write-back phase.

### sx module
If an immediate number exists, then the sign extension module can be used to extend it from 16 to 32 bits.

### write to dmem
The computed ALU result addresses the dmem for data operations. Data writing to dmem uses the data from the regfile (specifically data_readRegB).

### handle overflow
For write register, we need to deal with overflow, if it exists, we use register rstatus as the write register; if it doesn't exist, we write the result directly to the target register.

### write to regfile 
For the "Data to write to for regfile", we first need to determine, based on the ALU Opcode, what the value of $rstatus should be in the event of an overflow. This is then combined with the result when there is no overflow to produce the final ALU result. Finally, the source of the signal to be written back is determined by the 'is_WB' signal.