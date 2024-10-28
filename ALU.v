//Created by Joonseo Park

module ALU(

muxA, //output from Mux A --> 
muxB,
ALUControl,
ALUout

);
	parameter AND = 4'b0000;
	parameter OR = 4'b0001;
	parameter ADD = 4'b0010;
	parameter SUB = 4'b0110;

	input [31:0] muxA; //output of multiplexor A
	input [31:0] muxB;
	input [3:0] ALUControl; //4-bit ALU control signals
	output reg [31:0] ALUout; //ALUOut register
	
	reg zeroFlag;
	
	always@(*) begin //determines ALU operation mode based on control signal
		case(ALUControl)
		
			AND: ALUout = muxA & muxB;
			
			OR: ALUout = muxA | muxB;
			
			ADD: ALUout = muxA + muxB;
			
			SUB: ALUout = muxA - muxB;
			
			default: ALUout = 32'b0;
		
		endcase
	end
	
	always@(*) begin //turn on zero flag if output of ALU computation is zero
	
		if(ALUout == 0) begin
		
			zeroFlag = 1'b1;
			
		end
		else begin
		
			zeroFlag = 1'b0;
		
		end
	
	end

endmodule
