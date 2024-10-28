//Created by Joonseo Park
//Instruction/Data Memory for a RISC-V based microarchitecture

module IDMemory(

input [31:0] Address,
input clk,
input [31:0] writeData,
input writeEnable,
output reg [31:0] readData //RD register

);
	
	//allocate M10K memory blocks for RISC-V Processor Data + Instruction Memory
	//256 bits deep (256 addresses) and 32 bits wide (32 bits at each register)
	reg [31:0] RFMem [0:255] /* synthesis ramstyle = M10K*/;
	
	always@(posedge clk) begin
	
		if (writeEnable) RFMem[Address] <= writeData;
		
		else readData <= RFMem[Address];
	 
	end


endmodule
