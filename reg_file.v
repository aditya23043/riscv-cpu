module reg_file
#(
	parameter DATA_WIDTH = 32,
	parameter NUM_REGS = 32,
	parameter REG_ADDR_WIDTH = $clog2(NUM_REGS)
)
(
	input clk,
	input reset,

	input [REG_ADDR_WIDTH-1:0] a1, a2, a3,

	input [1:0] ResultSrc,
	input [DATA_WIDTH-1:0] alu_output,
	input [DATA_WIDTH-1:0] mem_data_output,
	input [7:0] pc,

	input write_enable,

	output [DATA_WIDTH-1:0] rd1, rd2
);

reg [DATA_WIDTH-1:0] registers [0:NUM_REGS-1];

integer i;

assign rd1 = a1 == 0
	? 0
	: registers[a1];
assign rd2 = a2 == 0
	? 0 
   	: registers[a2];

always @ (posedge clk)
begin
	if(reset)
	begin
		for(i = 0; i < NUM_REGS; i = i+1)
			registers[i] <= 0;
	end

	else if(write_enable && a3 != 0)
	begin
		if(ResultSrc == 2'b00)
			registers[a3] <= alu_output;
		else if(ResultSrc == 2'b01)
			registers[a3] <= mem_data_output;
		else if(ResultSrc == 2'b10)
			registers[a3] <= pc+4;
	end
end

endmodule
