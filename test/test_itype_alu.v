module test_itype_alu();

	tb cpu(.global_reset(1'b0));

	initial 
	begin
		$monitor("[CLK] time=%0t clk=%b", $time, cpu.clk);
	end

	initial
	begin

		$dumpfile("test_itype_alu.vcd");
		$dumpvars(0, cpu);

		cpu._instr_mem.mem[0] = 32'h02B08193; // addi x3,x1,43
		cpu._instr_mem.mem[1] = 32'h02B0F193; // andi x3,x1,43
		cpu._instr_mem.mem[2] = 32'h02B0E193; // ori x3,x1,43
		cpu._instr_mem.mem[3] = 32'h02B0A193; // slti x3,x1,43

		cpu._reg_file.registers[1] = 32'h0000_000A;
		// x1 = 0x0A = 10

		#10 
		$display("addi x3,x1,43");
		if(cpu._reg_file.registers[3] != 53)
			$display("ERROR! Wrong value at register x3");
		$display("add: %d (0x%h)", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);

		#10 
		$display("andi x3,x1,43");
		if(cpu._reg_file.registers[3] != 10)
			$display("ERROR! Wrong value at register x3");
		$display("and: %d (0x%h)", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);

		#10 
		$display("ori x3,x1,43");
		if(cpu._reg_file.registers[3] != 43)
			$display("ERROR! Wrong value at register x3");
		$display("or: %d (0x%h)", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);

		#10 
		$display("slti x3,x1,43");
		if(cpu._reg_file.registers[3] != 1)
			$display("ERROR! Wrong value at register x3");
		$display("slt: %d (0x%h)", cpu._reg_file.registers[3], cpu._reg_file.registers[3]);

		$finish;
	end

endmodule
