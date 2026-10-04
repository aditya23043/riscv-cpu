module alu
#(
	parameter DATA_WIDTH = 32
)
(
	input [DATA_WIDTH-1:0] rd1, rd2, imm,
	input wire [2:0] ALUControl,
	input wire ALUSrc,

	input reset,

	output zero, // required by control block for beq
	output reg [DATA_WIDTH-1:0] result
);

wire [DATA_WIDTH-1:0] operand2 = ALUSrc == 1 ? imm : rd2;

localparam ALU_ADD = 3'b000;
localparam ALU_SUB = 3'b001;
localparam ALU_AND = 3'b010;
localparam ALU_OR  = 3'b011;
localparam ALU_XOR = 3'b100;
localparam ALU_SLT = 3'b101;

always @(*)
begin

	if(reset)
		result = 0;
	else
		case (ALUControl)
			ALU_ADD:
				result = rd1 + operand2;

			ALU_SUB:
				result = rd1 - operand2;

			ALU_AND:
				result = rd1 & operand2;

			ALU_OR:
				result = rd1 | operand2;

			ALU_XOR:
				result = rd1 ^ operand2;

			ALU_SLT:
				result = (rd1 < operand2) ? 1 : 0;

			default:
				result = 0;
		endcase
end

assign zero = (result == 0);

endmodule
