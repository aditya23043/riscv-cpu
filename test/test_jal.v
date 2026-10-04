module test_jal();

	tb cpu(.global_reset(1'b0));

	initial 
	begin
		$monitor("[CLK] time=%0t clk=%b", $time, cpu.clk);
	end

	initial
	begin

		$dumpfile("test_jal.vcd");
		$dumpvars(0, cpu);

		cpu._instr_mem.mem[0] = 32'h002081B3; // add x3,x1,x2
		cpu._instr_mem.mem[1] = 32'h00C0026F; // jal x4,12 (byte offset for PC)
		cpu._instr_mem.mem[2] = 32'h402081B3; // sub x3,x1,x2
		cpu._instr_mem.mem[3] = 32'h0020F1B3; // and x3,x1,x2
		cpu._instr_mem.mem[4] = 32'h0020E1B3; // or x3,x1,x2
		cpu._instr_mem.mem[5] = 32'h0020A1B3; // slt x3,x1,x2

		cpu._reg_file.registers[1] = 32'h0000_000A;
		// x1 = 0x0A = 10
		cpu._reg_file.registers[2] = 32'h0000_001B;
		// x2 = 0x1B = 27

		#10 
		$display("add x3,x1,x2");
		if(cpu._reg_file.registers[3] != 37)
			$display("ERROR! Wrong value at register x3");
		$display("add: %d (0x%h)", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);

		#10 
		$display("jal x4,12");
		if(cpu._reg_file.registers[3] != 37)
			$display("ERROR! Wrong value at register x3");
		$display("jal: %d (0x%h) <- VALUES OF x3 REMAIN UNCHANGED BECAUSE JAL", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);
		if(cpu._reg_file.registers[4] != 8)
			$display("ERROR! JAL return address is incorrect");
		$display("  Also, x4=0x%h", cpu._reg_file.registers[4]);

		#10 
		$display("sub x3,x1,x2 (SKIPPED)");
		$display("and x3,x1,x2 (SKIPPED)");
		$display("or x3,x1,x2");
		if(cpu._reg_file.registers[3] != 27)
			$display("ERROR! Wrong value at register x3");
		$display("or: %d (0x%h) <- SKIPPED SUB & AND to directly OR operation", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);

		#10 
		$display("slt x3,x1,x2");
		if(cpu._reg_file.registers[3] != 1)
			$display("ERROR! Wrong value at register x3");
		$display("slt: %d (0x%h) <- CONTINUE AHEAD AS NORMAL", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);

		$finish;
	end

endmodule
