module decoder
#(
	parameter DATA_WIDTH = 32,
	parameter NUM_REGS = 32,
	parameter REG_ADDR_WIDTH = $clog2(NUM_REGS),
	parameter OPCODE_WIDTH = 7,
	parameter IMM_WIDTH = 12,
	parameter FUNCT3_WIDTH = 3,
	parameter FUNCT7_WIDTH = 7
)
(
	input [DATA_WIDTH-1:0] instruction,
	input [1:0] ImmSrc,
	input reset,

	output reg [OPCODE_WIDTH-1:0] opcode,
	output reg [REG_ADDR_WIDTH-1:0] rs1,
	output reg [REG_ADDR_WIDTH-1:0] rs2,
	output reg [REG_ADDR_WIDTH-1:0] rd,

	output reg [FUNCT3_WIDTH-1:0] f3,
	output reg [FUNCT7_WIDTH-1:0] f7,
	
	output reg [DATA_WIDTH-1:0] immediate
);

	always @(*)
	begin

		if(!reset)
		begin
			opcode = instruction[0 +: OPCODE_WIDTH];

			rd = instruction[OPCODE_WIDTH +: REG_ADDR_WIDTH];
			f3 = instruction[OPCODE_WIDTH + REG_ADDR_WIDTH +: FUNCT3_WIDTH];

			rs1 = instruction[OPCODE_WIDTH + REG_ADDR_WIDTH + FUNCT3_WIDTH +: REG_ADDR_WIDTH];
			rs2 = instruction[OPCODE_WIDTH + REG_ADDR_WIDTH + FUNCT3_WIDTH + REG_ADDR_WIDTH +: REG_ADDR_WIDTH];

			f7 = instruction[OPCODE_WIDTH + REG_ADDR_WIDTH + FUNCT3_WIDTH + REG_ADDR_WIDTH + REG_ADDR_WIDTH +: FUNCT7_WIDTH];

			// sign extension in the decoder itself. no separate extender block

			case(ImmSrc)

				2'b00: // load (lw)
					immediate = {{(DATA_WIDTH - IMM_WIDTH){instruction[DATA_WIDTH-1]}},  instruction[OPCODE_WIDTH + REG_ADDR_WIDTH + FUNCT3_WIDTH + REG_ADDR_WIDTH +: IMM_WIDTH]};
				2'b01: // store (sw)
					immediate = {
						{(DATA_WIDTH-IMM_WIDTH){instruction[DATA_WIDTH-1]}},
						instruction[OPCODE_WIDTH + REG_ADDR_WIDTH + FUNCT3_WIDTH + REG_ADDR_WIDTH + REG_ADDR_WIDTH +: IMM_WIDTH-REG_ADDR_WIDTH],
						instruction[OPCODE_WIDTH +: REG_ADDR_WIDTH]
					};

				2'b10: // branch (beq)
					immediate = {
						{(DATA_WIDTH-IMM_WIDTH-1){instruction[DATA_WIDTH-1]}},
						instruction[DATA_WIDTH-1],
						instruction[OPCODE_WIDTH],
						instruction[DATA_WIDTH-1-1 -: OPCODE_WIDTH-1],
						instruction[OPCODE_WIDTH+1 +: REG_ADDR_WIDTH-1],
						1'b0
					}; // this last hardcoded 0 so that PC does not jump to an invalid address like an odd numbered address
					// not 2'b00 to allow flexibility such that 8/16 bit instructions can also be executed

				2'b11: // jump and link (jal)
					immediate = {
						{(REG_ADDR_WIDTH+OPCODE_WIDTH-1){instruction[DATA_WIDTH-1]}},
						instruction[DATA_WIDTH-1],
						instruction[REG_ADDR_WIDTH+OPCODE_WIDTH +: OPCODE_WIDTH+1],
						instruction[REG_ADDR_WIDTH+OPCODE_WIDTH+OPCODE_WIDTH+1],
						instruction[DATA_WIDTH-1-1 -: 10],
						1'b0
					};

			endcase
		end
	end

endmodule
