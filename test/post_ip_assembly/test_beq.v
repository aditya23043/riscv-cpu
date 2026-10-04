module test_beq();

	cpu_model cpu(
		.enable(1'b1),
		.reset(1'b0)
	);

	initial 
	begin
		$monitor("[CLK] time=%0t clk=%b", $time, cpu.clk_gen_0_0.clk);
	end

	initial
	begin

		$dumpfile("test_beq.vcd");
		$dumpvars(0, cpu);

		cpu.instr_mem_0_0.mem[0] = 32'h002081B3; // add x3,x1,x2
		cpu.instr_mem_0_0.mem[1] = 32'h00318663; // beq x3,x3,12 (byte offset for PC)
		cpu.instr_mem_0_0.mem[2] = 32'h402081B3; // sub x3,x1,x2
		cpu.instr_mem_0_0.mem[3] = 32'h0020F1B3; // and x3,x1,x2
		cpu.instr_mem_0_0.mem[4] = 32'h0020E1B3; // or x3,x1,x2
		cpu.instr_mem_0_0.mem[5] = 32'h0020A1B3; // slt x3,x1,x2

		cpu.reg_file_0_0.registers[1] = 32'h0000_000A;
		// x1 = 0x0A = 10
		cpu.reg_file_0_0.registers[2] = 32'h0000_001B;
		// x2 = 0x1B = 27

		#10 
		$display("add x3,x1,x2");
		if(cpu.reg_file_0_0.registers[3] != 37)
			$display("ERROR! Wrong value at register x3");
		$display("add: %d (0x%h)", cpu.reg_file_0_0.registers[3], cpu.reg_file_0_0.registers[3]);

		#10 
		$display("beq x3,x3,12");
		if(cpu.reg_file_0_0.registers[3] != 37)
			$display("ERROR! Wrong value at register x3");
		$display("beq: %d (0x%h) <- VALUES OF x3 REMAIN UNCHANGED BECAUSE BEQ", cpu.reg_file_0_0.registers[3], cpu.reg_file_0_0.registers[3]);

		#10 
		$display("sub x3,x1,x2 (SKIPPED)");
		$display("and x3,x1,x2 (SKIPPED)");
		$display("or x3,x1,x2");
		if(cpu.reg_file_0_0.registers[3] != 27)
			$display("ERROR! Wrong value at register x3");
		$display("or: %d (0x%h) <- SKIPPED SUB & AND to directly OR operation", cpu.reg_file_0_0.registers[3], cpu.reg_file_0_0.registers[3]);

		#10 
		$display("slt x3,x1,x2");
		if(cpu.reg_file_0_0.registers[3] != 1)
			$display("ERROR! Wrong value at register x3");
		$display("slt: %d (0x%h) <- CONTINUE AHEAD AS NORMAL", cpu.reg_file_0_0.registers[3], cpu.reg_file_0_0.registers[3]);

		$finish;
	end

endmodule
