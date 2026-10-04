build:
	iverilog \
		-o test_beq.vvp \
		test_beq.v \
		../../*.v \
		../../../ipxact_scratch/grp8/addv-a2/cpu_model/1.0/cpu_model.v
	iverilog \
		-o test_lw.vvp \
		test_lw.v \
		../../*.v \
		../../../ipxact_scratch/grp8/addv-a2/cpu_model/1.0/cpu_model.v
	iverilog \
		-o test_itype_alu.vvp \
		test_itype_alu.v \
		../../*.v \
		../../../ipxact_scratch/grp8/addv-a2/cpu_model/1.0/cpu_model.v
	iverilog \
		-o test_sw.vvp \
		test_sw.v \
		../../*.v \
		../../../ipxact_scratch/grp8/addv-a2/cpu_model/1.0/cpu_model.v
	iverilog \
		-o test_rtype.vvp \
		test_rtype.v \
		../../*.v \
		../../../ipxact_scratch/grp8/addv-a2/cpu_model/1.0/cpu_model.v
	iverilog \
		-o test_jal.vvp \
		test_jal.v \
		../../*.v \
		../../../ipxact_scratch/grp8/addv-a2/cpu_model/1.0/cpu_model.v

test:
	@echo "\n-----LW-------\n"
	vvp test_lw.vvp
	@echo "\n-----SW-------\n"
	vvp test_sw.vvp
	@echo "\n-----ALU-------\n"
	vvp test_rtype.vvp
	@echo "\n-----BEQ-------\n"
	vvp test_beq.vvp
	@echo "\n-----ALU (Imm)-------\n"
	vvp test_itype_alu.vvp
	@echo "\n-----JAL-------\n"
	vvp test_jal.vvp
