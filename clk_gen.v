module clk_gen
#
(
	parameter PERIOD = 10
)
(
	input enable, input reset, output reg clk
);

    initial
	begin
		clk = 1'b0;
	end

	always
	begin
		if(reset)
			clk = 1'b0;

		if(enable)
			#(PERIOD/2) clk = ~clk;

	end

endmodule
