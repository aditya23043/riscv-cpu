module test_sw();

	tb cpu(.global_reset(1'b0));

	initial 
	begin
		$monitor("time=%0t clk=%b", $time, cpu.clk);
	end

	initial
	begin

		$dumpfile("test_sw.vcd");
		$dumpvars(0, cpu);

		cpu._instr_mem.mem[0] = 32'h0064A423;
		// sw x6 8(x9)

		$display("sw x6 8(x9)");

		cpu._reg_file.registers[9] = 32'h0000_000A;
		// x9 = 0x0A = 10
		// 8(x9) = 0x12 = 18

		cpu._reg_file.registers[6] = 32'h1234_ABCD;
		// data at (0x6) = 0xABCD_1234

		#10
		if(cpu._data_mem.mem[18] != 32'h1234_ABCD)
		begin
			$display("ERROR! Wrong value at memory location 0x18");
		end
		$display("mem[18] = %h", cpu._data_mem.mem[18]);

		$finish;
	end

endmodule
