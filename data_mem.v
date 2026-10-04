module data_mem
#(
	parameter DATA_WIDTH = 32,
	parameter DEPTH = 256,
	parameter ADDR_WIDTH = $clog2(DEPTH)
)
(
	input clk,
	input [DATA_WIDTH-1:0] address,
	input [DATA_WIDTH-1:0] write_data,
	input write_enable,
	input reset,

	output [DATA_WIDTH-1:0] read_data
);

	reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];

	assign read_data = (reset == 1'b0) ? mem[address[ADDR_WIDTH-1:0]] : 0;

	always @(posedge clk)
	begin
		if(!reset)
		begin
			if(write_enable)
			begin
				mem[address] <= write_data;
			end
		end
	end

endmodule
