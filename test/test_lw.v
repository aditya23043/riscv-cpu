module test_lw();

	tb cpu(.global_reset(1'b0));

	initial 
	begin
		$monitor("time=%0t clk=%b", $time, cpu.clk);
	end

	initial
	begin

		$dumpfile("test_lw.vcd");
		$dumpvars(0, cpu);

		cpu._instr_mem.mem[0] = 32'hFFC4A303;
		// lw x6 -4(x9)

		cpu._reg_file.registers[9] = 32'h0000_000A;
		// x9 = 0xA = 10
		// -4(x9) = 0x6 = 6

		cpu._data_mem.mem[6] = 32'hABCD_1234;
		// data at (0x6) = 0xABCD_1234

		// now when running the instruction, we should see this value in x6 register after a cycle

		#10 

		$display("lw x6, -4(x9)");
		if(cpu._reg_file.registers[6] != 32'hABCD_1234)
		begin
			$display("ERROR! Wrong value at register x6");
		end
		$display("x6 = %h", cpu._reg_file.registers[6]);

		$finish;
	end

endmodule
