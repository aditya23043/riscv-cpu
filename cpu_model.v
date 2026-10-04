//-----------------------------------------------------------------------------
// File          : cpu_model.v
// Creation date : 27.09.2026
// Creation time : 21:35:46
// Description   : 
// Created by    : adi
// Tool : Kactus2 3.14.2 64-bit
// Plugin : Verilog generator 2.4
// This file was generated based on IP-XACT component grp8:addv-a2:cpu_model:1.0
// whose XML file is /Users/adi/Developer/Repo/ADDV-A2/ipxact_scratch/grp8/addv-a2/cpu_model/1.0/cpu_model.1.0.xml
//-----------------------------------------------------------------------------

module cpu_model(
    // These ports are not in any interface
    input                               enable,
    input                               reset
);

    // Ad-hoc wires:
    wire       clk_gen_0_0_reset_to_reset;
    wire       pc_reg_0_0_reset_to_reset;
    wire       instr_mem_0_0_reset_to_reset;
    wire       decoder_0_0_reset_to_reset;
    wire       reg_file_0_0_reset_to_reset;
    wire       controller_0_0_reset_to_reset;
    wire       alu_0_0_reset_to_reset;
    wire       data_mem_0_0_reset_to_reset;
    wire       clk_gen_0_0_enable_to_enable;
    wire       clk_gen_0_0_clk_to_pc_reg_0_0_clk;
    wire       clk_gen_0_0_clk_to_reg_file_0_0_clk;
    wire       clk_gen_0_0_clk_to_data_mem_0_0_clk;
    wire [2:0] controller_0_0_f3_to_decoder_0_0_f3;
    wire [6:0] decoder_0_0_f7_to_controller_0_0_f7;
    wire [6:0] decoder_0_0_opcode_to_controller_0_0_opcode;
    wire [4:0] decoder_0_0_rs1_to_reg_file_0_0_a1;
    wire [4:0] decoder_0_0_rd_to_reg_file_0_0_a3;
    wire [4:0] decoder_0_0_rs2_to_reg_file_0_0_a2;
    wire [31:0] decoder_0_0_immediate_to_alu_0_0_imm;
    wire [31:0] instr_mem_0_0_data_to_decoder_0_0_instruction;
    wire [7:0] pc_reg_0_0_pc_to_instr_mem_0_0_pc;
    wire [31:0] pc_reg_0_0_branchImmTarget_to_decoder_0_0_immediate;
    wire       pc_reg_0_0_PCSrc_to_controller_0_0_PCSrc;
    wire       controller_0_0_beq_zero_to_alu_0_0_zero;
    wire       alu_0_0_ALUSrc_to_controller_0_0_ALUSrc;
    wire [2:0] alu_0_0_ALUControl_to_controller_0_0_ALUControl;
    wire [31:0] alu_0_0_rd1_to_reg_file_0_0_rd1;
    wire [31:0] reg_file_0_0_rd2_to_alu_0_0_rd2;
    wire [31:0] alu_0_0_result_to_data_mem_0_0_address;
    wire [31:0] alu_0_0_result_to_reg_file_0_0_alu_output;
    wire [1:0] decoder_0_0_ImmSrc_to_controller_0_0_ImmSrc;
    wire       reg_file_0_0_write_enable_to_controller_0_0_RegWrite;
    wire       controller_0_0_MemWrite_to_data_mem_0_0_write_enable;
    wire [31:0] data_mem_0_0_write_data_to_reg_file_0_0_rd2;
    wire [31:0] data_mem_0_0_read_data_to_reg_file_0_0_mem_data_output;
    wire [1:0] controller_0_0_ResultSrc_to_reg_file_0_0_ResultSrc;
    wire [7:0] reg_file_0_0_pc_to_pc_reg_0_0_pc;

    // alu_0_0 port wires:
    wire [2:0] alu_0_0_ALUControl;
    wire       alu_0_0_ALUSrc;
    wire [31:0] alu_0_0_imm;
    wire [31:0] alu_0_0_rd1;
    wire [31:0] alu_0_0_rd2;
    wire       alu_0_0_reset;
    wire [31:0] alu_0_0_result;
    wire       alu_0_0_zero;
    // clk_gen_0_0 port wires:
    wire       clk_gen_0_0_clk;
    wire       clk_gen_0_0_enable;
    wire       clk_gen_0_0_reset;
    // controller_0_0 port wires:
    wire [2:0] controller_0_0_ALUControl;
    wire       controller_0_0_ALUSrc;
    wire [1:0] controller_0_0_ImmSrc;
    wire       controller_0_0_MemWrite;
    wire       controller_0_0_PCSrc;
    wire       controller_0_0_RegWrite;
    wire [1:0] controller_0_0_ResultSrc;
    wire       controller_0_0_beq_zero;
    wire [2:0] controller_0_0_f3;
    wire [6:0] controller_0_0_f7;
    wire [6:0] controller_0_0_opcode;
    wire       controller_0_0_reset;
    // data_mem_0_0 port wires:
    wire [31:0] data_mem_0_0_address;
    wire       data_mem_0_0_clk;
    wire [31:0] data_mem_0_0_read_data;
    wire       data_mem_0_0_reset;
    wire [31:0] data_mem_0_0_write_data;
    wire       data_mem_0_0_write_enable;
    // decoder_0_0 port wires:
    wire [1:0] decoder_0_0_ImmSrc;
    wire [2:0] decoder_0_0_f3;
    wire [6:0] decoder_0_0_f7;
    wire [31:0] decoder_0_0_immediate;
    wire [31:0] decoder_0_0_instruction;
    wire [6:0] decoder_0_0_opcode;
    wire [4:0] decoder_0_0_rd;
    wire       decoder_0_0_reset;
    wire [4:0] decoder_0_0_rs1;
    wire [4:0] decoder_0_0_rs2;
    // instr_mem_0_0 port wires:
    wire [31:0] instr_mem_0_0_data;
    wire [7:0] instr_mem_0_0_pc;
    wire       instr_mem_0_0_reset;
    // pc_reg_0_0 port wires:
    wire       pc_reg_0_0_PCSrc;
    wire [31:0] pc_reg_0_0_branchImmTarget;
    wire       pc_reg_0_0_clk;
    wire [7:0] pc_reg_0_0_pc;
    wire       pc_reg_0_0_reset;
    // reg_file_0_0 port wires:
    wire [1:0] reg_file_0_0_ResultSrc;
    wire [4:0] reg_file_0_0_a1;
    wire [4:0] reg_file_0_0_a2;
    wire [4:0] reg_file_0_0_a3;
    wire [31:0] reg_file_0_0_alu_output;
    wire       reg_file_0_0_clk;
    wire [31:0] reg_file_0_0_mem_data_output;
    wire [7:0] reg_file_0_0_pc;
    wire [31:0] reg_file_0_0_rd1;
    wire [31:0] reg_file_0_0_rd2;
    wire       reg_file_0_0_reset;
    wire       reg_file_0_0_write_enable;

    // Assignments for the ports of the encompassing component:
    assign clk_gen_0_0_enable_to_enable = enable;
    assign alu_0_0_reset_to_reset = reset;
    assign clk_gen_0_0_reset_to_reset = reset;
    assign controller_0_0_reset_to_reset = reset;
    assign data_mem_0_0_reset_to_reset = reset;
    assign decoder_0_0_reset_to_reset = reset;
    assign instr_mem_0_0_reset_to_reset = reset;
    assign pc_reg_0_0_reset_to_reset = reset;
    assign reg_file_0_0_reset_to_reset = reset;

    // alu_0_0 assignments:
    assign alu_0_0_ALUControl = alu_0_0_ALUControl_to_controller_0_0_ALUControl;
    assign alu_0_0_ALUSrc = alu_0_0_ALUSrc_to_controller_0_0_ALUSrc;
    assign alu_0_0_imm = decoder_0_0_immediate_to_alu_0_0_imm;
    assign alu_0_0_rd1 = alu_0_0_rd1_to_reg_file_0_0_rd1;
    assign alu_0_0_rd2 = reg_file_0_0_rd2_to_alu_0_0_rd2;
    assign alu_0_0_reset = alu_0_0_reset_to_reset;
    assign alu_0_0_result_to_data_mem_0_0_address = alu_0_0_result;
    assign alu_0_0_result_to_reg_file_0_0_alu_output = alu_0_0_result;
    assign controller_0_0_beq_zero_to_alu_0_0_zero = alu_0_0_zero;
    // clk_gen_0_0 assignments:
    assign clk_gen_0_0_clk_to_data_mem_0_0_clk = clk_gen_0_0_clk;
    assign clk_gen_0_0_clk_to_pc_reg_0_0_clk = clk_gen_0_0_clk;
    assign clk_gen_0_0_clk_to_reg_file_0_0_clk = clk_gen_0_0_clk;
    assign clk_gen_0_0_enable = clk_gen_0_0_enable_to_enable;
    assign clk_gen_0_0_reset = clk_gen_0_0_reset_to_reset;
    // controller_0_0 assignments:
    assign alu_0_0_ALUControl_to_controller_0_0_ALUControl = controller_0_0_ALUControl;
    assign alu_0_0_ALUSrc_to_controller_0_0_ALUSrc = controller_0_0_ALUSrc;
    assign decoder_0_0_ImmSrc_to_controller_0_0_ImmSrc = controller_0_0_ImmSrc;
    assign controller_0_0_MemWrite_to_data_mem_0_0_write_enable = controller_0_0_MemWrite;
    assign pc_reg_0_0_PCSrc_to_controller_0_0_PCSrc = controller_0_0_PCSrc;
    assign reg_file_0_0_write_enable_to_controller_0_0_RegWrite = controller_0_0_RegWrite;
    assign controller_0_0_ResultSrc_to_reg_file_0_0_ResultSrc = controller_0_0_ResultSrc;
    assign controller_0_0_beq_zero = controller_0_0_beq_zero_to_alu_0_0_zero;
    assign controller_0_0_f3 = controller_0_0_f3_to_decoder_0_0_f3;
    assign controller_0_0_f7 = decoder_0_0_f7_to_controller_0_0_f7;
    assign controller_0_0_opcode = decoder_0_0_opcode_to_controller_0_0_opcode;
    assign controller_0_0_reset = controller_0_0_reset_to_reset;
    // data_mem_0_0 assignments:
    assign data_mem_0_0_address = alu_0_0_result_to_data_mem_0_0_address;
    assign data_mem_0_0_clk = clk_gen_0_0_clk_to_data_mem_0_0_clk;
    assign data_mem_0_0_read_data_to_reg_file_0_0_mem_data_output = data_mem_0_0_read_data;
    assign data_mem_0_0_reset = data_mem_0_0_reset_to_reset;
    assign data_mem_0_0_write_data = data_mem_0_0_write_data_to_reg_file_0_0_rd2;
    assign data_mem_0_0_write_enable = controller_0_0_MemWrite_to_data_mem_0_0_write_enable;
    // decoder_0_0 assignments:
    assign decoder_0_0_ImmSrc = decoder_0_0_ImmSrc_to_controller_0_0_ImmSrc;
    assign controller_0_0_f3_to_decoder_0_0_f3 = decoder_0_0_f3;
    assign decoder_0_0_f7_to_controller_0_0_f7 = decoder_0_0_f7;
    assign decoder_0_0_immediate_to_alu_0_0_imm = decoder_0_0_immediate;
    assign pc_reg_0_0_branchImmTarget_to_decoder_0_0_immediate = decoder_0_0_immediate;
    assign decoder_0_0_instruction = instr_mem_0_0_data_to_decoder_0_0_instruction;
    assign decoder_0_0_opcode_to_controller_0_0_opcode = decoder_0_0_opcode;
    assign decoder_0_0_rd_to_reg_file_0_0_a3 = decoder_0_0_rd;
    assign decoder_0_0_reset = decoder_0_0_reset_to_reset;
    assign decoder_0_0_rs1_to_reg_file_0_0_a1 = decoder_0_0_rs1;
    assign decoder_0_0_rs2_to_reg_file_0_0_a2 = decoder_0_0_rs2;
    // instr_mem_0_0 assignments:
    assign instr_mem_0_0_data_to_decoder_0_0_instruction = instr_mem_0_0_data;
    assign instr_mem_0_0_pc = pc_reg_0_0_pc_to_instr_mem_0_0_pc;
    assign instr_mem_0_0_reset = instr_mem_0_0_reset_to_reset;
    // pc_reg_0_0 assignments:
    assign pc_reg_0_0_PCSrc = pc_reg_0_0_PCSrc_to_controller_0_0_PCSrc;
    assign pc_reg_0_0_branchImmTarget = pc_reg_0_0_branchImmTarget_to_decoder_0_0_immediate;
    assign pc_reg_0_0_clk = clk_gen_0_0_clk_to_pc_reg_0_0_clk;
    assign pc_reg_0_0_pc_to_instr_mem_0_0_pc = pc_reg_0_0_pc;
    assign reg_file_0_0_pc_to_pc_reg_0_0_pc = pc_reg_0_0_pc;
    assign pc_reg_0_0_reset = pc_reg_0_0_reset_to_reset;
    // reg_file_0_0 assignments:
    assign reg_file_0_0_ResultSrc = controller_0_0_ResultSrc_to_reg_file_0_0_ResultSrc;
    assign reg_file_0_0_a1 = decoder_0_0_rs1_to_reg_file_0_0_a1;
    assign reg_file_0_0_a2 = decoder_0_0_rs2_to_reg_file_0_0_a2;
    assign reg_file_0_0_a3 = decoder_0_0_rd_to_reg_file_0_0_a3;
    assign reg_file_0_0_alu_output = alu_0_0_result_to_reg_file_0_0_alu_output;
    assign reg_file_0_0_clk = clk_gen_0_0_clk_to_reg_file_0_0_clk;
    assign reg_file_0_0_mem_data_output = data_mem_0_0_read_data_to_reg_file_0_0_mem_data_output;
    assign reg_file_0_0_pc = reg_file_0_0_pc_to_pc_reg_0_0_pc;
    assign alu_0_0_rd1_to_reg_file_0_0_rd1 = reg_file_0_0_rd1;
    assign data_mem_0_0_write_data_to_reg_file_0_0_rd2 = reg_file_0_0_rd2;
    assign reg_file_0_0_rd2_to_alu_0_0_rd2 = reg_file_0_0_rd2;
    assign reg_file_0_0_reset = reg_file_0_0_reset_to_reset;
    assign reg_file_0_0_write_enable = reg_file_0_0_write_enable_to_controller_0_0_RegWrite;

    // IP-XACT VLNV: grp8:addv-a2:alu:2.0
    alu #(
        .DATA_WIDTH          (32))
    alu_0_0(
        // These ports are not in any interface
        .ALUControl          (alu_0_0_ALUControl),
        .ALUSrc              (alu_0_0_ALUSrc),
        .imm                 (alu_0_0_imm),
        .rd1                 (alu_0_0_rd1),
        .rd2                 (alu_0_0_rd2),
        .reset               (alu_0_0_reset),
        .result              (alu_0_0_result),
        .zero                (alu_0_0_zero));

    // IP-XACT VLNV: grp8:addv-a2:clk_gen:2.0
    clk_gen #(
        .PERIOD              (10))
    clk_gen_0_0(
        // These ports are not in any interface
        .enable              (clk_gen_0_0_enable),
        .reset               (clk_gen_0_0_reset),
        .clk                 (clk_gen_0_0_clk));

    // IP-XACT VLNV: grp8:addv-a2:controller:2.0
    controller #(
        .OPCODE_WIDTH        (7),
        .FUNCT3_WIDTH        (3),
        .FUNCT7_WIDTH        (7))
    controller_0_0(
        // These ports are not in any interface
        .beq_zero            (controller_0_0_beq_zero),
        .f3                  (controller_0_0_f3),
        .f7                  (controller_0_0_f7),
        .opcode              (controller_0_0_opcode),
        .reset               (controller_0_0_reset),
        .ALUControl          (controller_0_0_ALUControl),
        .ALUSrc              (controller_0_0_ALUSrc),
        .ImmSrc              (controller_0_0_ImmSrc),
        .MemWrite            (controller_0_0_MemWrite),
        .PCSrc               (controller_0_0_PCSrc),
        .RegWrite            (controller_0_0_RegWrite),
        .ResultSrc           (controller_0_0_ResultSrc));

    // IP-XACT VLNV: grp8:addv-a2:data_mem:2.0
    data_mem #(
        .DATA_WIDTH          (32),
        .DEPTH               (256),
        .ADDR_WIDTH          (8))
    data_mem_0_0(
        // These ports are not in any interface
        .address             (data_mem_0_0_address),
        .clk                 (data_mem_0_0_clk),
        .reset               (data_mem_0_0_reset),
        .write_data          (data_mem_0_0_write_data),
        .write_enable        (data_mem_0_0_write_enable),
        .read_data           (data_mem_0_0_read_data));

    // IP-XACT VLNV: grp8:addv-a2:decoder:2.0
    decoder #(
        .DATA_WIDTH          (32),
        .NUM_REGS            (32),
        .REG_ADDR_WIDTH      (5),
        .OPCODE_WIDTH        (7),
        .IMM_WIDTH           (12),
        .FUNCT3_WIDTH        (3),
        .FUNCT7_WIDTH        (7))
    decoder_0_0(
        // These ports are not in any interface
        .ImmSrc              (decoder_0_0_ImmSrc),
        .instruction         (decoder_0_0_instruction),
        .reset               (decoder_0_0_reset),
        .f3                  (decoder_0_0_f3),
        .f7                  (decoder_0_0_f7),
        .immediate           (decoder_0_0_immediate),
        .opcode              (decoder_0_0_opcode),
        .rd                  (decoder_0_0_rd),
        .rs1                 (decoder_0_0_rs1),
        .rs2                 (decoder_0_0_rs2));

    // IP-XACT VLNV: grp8:addv-a2:instr_mem:2.0
    instr_mem #(
        .DATA_WIDTH          (32),
        .DEPTH               (256),
        .ADDR_WIDTH          (8))
    instr_mem_0_0(
        // These ports are not in any interface
        .pc                  (instr_mem_0_0_pc),
        .reset               (instr_mem_0_0_reset),
        .data                (instr_mem_0_0_data));

    // IP-XACT VLNV: grp8:addv-a2:pc_reg:2.0
    pc_reg #(
        .PC_WIDTH            (8),
        .DATA_WIDTH          (32),
        .PC_START            (0))
    pc_reg_0_0(
        // These ports are not in any interface
        .branchImmTarget     (pc_reg_0_0_branchImmTarget),
        .clk                 (pc_reg_0_0_clk),
        .PCSrc               (pc_reg_0_0_PCSrc),
        .reset               (pc_reg_0_0_reset),
        .pc                  (pc_reg_0_0_pc));

    // IP-XACT VLNV: grp8:addv-a2:reg_file:2.0
    reg_file #(
        .DATA_WIDTH          (32),
        .NUM_REGS            (32),
        .REG_ADDR_WIDTH      (5))
    reg_file_0_0(
        // These ports are not in any interface
        .a1                  (reg_file_0_0_a1),
        .a2                  (reg_file_0_0_a2),
        .a3                  (reg_file_0_0_a3),
        .alu_output          (reg_file_0_0_alu_output),
        .clk                 (reg_file_0_0_clk),
        .mem_data_output     (reg_file_0_0_mem_data_output),
        .pc                  (reg_file_0_0_pc),
        .reset               (reg_file_0_0_reset),
        .ResultSrc           (reg_file_0_0_ResultSrc),
        .write_enable        (reg_file_0_0_write_enable),
        .rd1                 (reg_file_0_0_rd1),
        .rd2                 (reg_file_0_0_rd2));


endmodule
