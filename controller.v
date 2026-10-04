module controller
#(
	parameter OPCODE_WIDTH = 7,
	parameter FUNCT3_WIDTH = 3,
	parameter FUNCT7_WIDTH = 7
)
(
	input [OPCODE_WIDTH-1:0] opcode,
	input [FUNCT3_WIDTH-1:0] f3,
	input [FUNCT7_WIDTH-1:0] f7,
	input beq_zero,

	input reset,

	output reg PCSrc,
	output reg [1:0] ResultSrc,
	output reg MemWrite,
	output reg [2:0] ALUControl,
	output reg ALUSrc,
	output reg [1:0] ImmSrc,
	output reg RegWrite
);

// -- I type LOAD --
localparam OPCODE_LW = 7'b0000011;
// -- S type STORE --
localparam OPCODE_SW = 7'b0100011;
// -- R type --
localparam OPCODE_RTYPE = 7'b0110011;
// -- B type BEQ --
localparam OPCODE_BTYPE = 7'b1100011;
// -- I type ALU --
localparam OPCODE_ITYPE_ALU = 7'b0010011;
// -- J type (jal) --
localparam OPCODE_JAL = 7'b1101111;

localparam ALU_ADD = 3'b000;
localparam ALU_SUB = 3'b001;
localparam ALU_AND = 3'b010;
localparam ALU_OR = 3'b011;
localparam ALU_SLT = 3'b101;

always @(*)
begin

	PCSrc = 0;
	ResultSrc = 0;
	MemWrite = 0;
	ALUControl = 0;
	ALUSrc = 0;
	ImmSrc = 0;
	RegWrite = 0;
	
	if(!reset)
	begin
		case(opcode)

			OPCODE_LW:
			begin
				ALUControl = ALU_ADD;
				ALUSrc = 1; // input from Imm instead of a2
				ResultSrc = 1; // writeback value from data mem
				RegWrite = 1;
			end

			OPCODE_SW:
			begin
				ImmSrc = 1;
				ALUSrc = 1;
				MemWrite = 1;
			end

			OPCODE_RTYPE:
			begin
				RegWrite = 1;

				if(f3 == 3'b000 && f7 == 7'b0000000)
					ALUControl = ALU_ADD; // add
				else if(f3 == 3'b000 && f7 == 7'b0100000)
					ALUControl = ALU_SUB; // sub
				else if(f3 == 3'b111 && f7 == 7'b0000000)
					ALUControl = ALU_AND; // and
				else if(f3 == 3'b110 && f7 == 7'b0000000)
					ALUControl = ALU_OR; // or
				else if(f3 == 3'b010 && f7 == 7'b0000000)
					ALUControl = ALU_SLT; // slt
			end

			OPCODE_BTYPE:
			begin
				ImmSrc = 2'b10;
				ALUControl = ALU_SUB;
				if(beq_zero)
				begin
					PCSrc = 1;
				end
			end

			OPCODE_ITYPE_ALU:
			begin
				ALUSrc = 1; // input of ALU from imm
				RegWrite = 1;

				if(f3 == 3'b000)
					ALUControl = ALU_ADD; // add
				else if(f3 == 3'b111)
					ALUControl = ALU_AND; // and
				else if(f3 == 3'b110)
					ALUControl = ALU_OR; // or
				else if(f3 == 3'b010)
					ALUControl = ALU_SLT; // slt
			end

			OPCODE_JAL:
			begin
				ResultSrc = 2'b10;
				RegWrite = 1;
				ImmSrc = 2'b11;
				PCSrc = 1;
			end

		endcase
	end
end

endmodule
