module instr_mem 
#(
	parameter DATA_WIDTH = 32,
	parameter DEPTH = 256,
	parameter ADDR_WIDTH = $clog2(DEPTH)
)
(
	input [ADDR_WIDTH-1:0] pc,
	input reset,
	output [DATA_WIDTH-1:0] data
);

	reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];

	assign data = (reset == 0) ? mem[pc >> 2] : 0;

endmodule
