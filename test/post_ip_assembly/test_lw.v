module test_lw();

	cpu_model cpu(
		.enable(1'b1),
		.reset(1'b0)
	);

	initial 
	begin
		$monitor("time=%0t clk=%b", $time, cpu.clk_gen_0_0.clk);
	end

	initial
	begin

		$dumpfile("test_lw.vcd");
		$dumpvars(0, cpu);

		cpu.instr_mem_0_0.mem[0] = 32'hFFC4A303;
		// lw x6 -4(x9)

		cpu.reg_file_0_0.registers[9] = 32'h0000_000A;
		// x9 = 0xA = 10
		// -4(x9) = 0x6 = 6

		cpu.data_mem_0_0.mem[6] = 32'hABCD_1234;
		// data at (0x6) = 0xABCD_1234

		// now when running the instruction, we should see this value in x6 register after a cycle

		#10

		$display("lw x6, -4(x9)");
		if(cpu.reg_file_0_0.registers[6] != 32'hABCD_1234)
		begin
			$display("ERROR! Wrong value at register x6");
		end

		$display("x6 = %h", cpu.reg_file_0_0.registers[6]);

		$finish;
	end

endmodule
