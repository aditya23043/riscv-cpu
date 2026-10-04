module tb(
	input global_reset
);

	wire clk;
	wire [7:0] pc;
	wire [31:0] instruction;

	wire [6:0] opcode;
	wire [4:0] rs1, rs2, rd;
	wire [31:0] imm;
	wire [2:0] funct3;
	wire [6:0] funct7;

	wire [31:0] read_data_1, read_data_2;

	wire PCSrc;
	wire [1:0] ResultSrc;
	wire MemWrite;
	wire [2:0] ALUControl;
	wire ALUSrc;
	wire [1:0] ImmSrc;
	wire RegWrite;
	wire alu_output_is_zero_beq;

	wire [31:0] alu_output;

	wire [31:0] memory_data_output;

	clk_gen _clk_gen (
		.enable(1'b1),
		.reset(global_reset),
		.clk(clk)
	);

	pc_reg _pc_reg (
		.reset(global_reset),
		.clk(clk),
		.PCSrc(PCSrc),
		.branchImmTarget(imm),
		.pc(pc)
	);

	instr_mem _instr_mem (
		.reset(global_reset),
		.pc(pc),
		.data(instruction)
	);

	decoder _decoder (
		.reset(global_reset),
		.instruction(instruction),
		.opcode(opcode),
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd),
		.immediate(imm),
		.f3(funct3),
		.f7(funct7),
		.ImmSrc(ImmSrc)
	);

	reg_file _reg_file (
		.clk(clk),
		.reset(global_reset),
		.a1(rs1),
		.a2(rs2),
		.a3(rd),
		.write_enable(RegWrite),
		.rd1(read_data_1),
		.rd2(read_data_2),
		.ResultSrc(ResultSrc),
		.alu_output(alu_output),
		.mem_data_output(memory_data_output),
		.pc(pc)
	);

	controller _controller (
		.opcode(opcode),
		.f3(funct3),
		.f7(funct7),
		.beq_zero(alu_output_is_zero_beq),
		.reset(global_reset),
		.PCSrc(PCSrc),
		.ResultSrc(ResultSrc),
		.MemWrite(MemWrite),
		.ALUControl(ALUControl),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.RegWrite(RegWrite)
	);

	alu _alu (
		.reset(global_reset),
		.rd1(read_data_1),
		.rd2(read_data_2),
		.imm(imm),
		.ALUSrc(ALUSrc),
		.ALUControl(ALUControl),
		.zero(alu_output_is_zero_beq),
		.result(alu_output)
	);

	data_mem _data_mem (
		.reset(global_reset),
		.clk(clk),
		.address(alu_output),
		.write_data(read_data_2),
		.write_enable(MemWrite),
		.read_data(memory_data_output)
	);

endmodule
