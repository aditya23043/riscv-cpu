module pc_reg 
#(
	parameter PC_WIDTH = 8,
	parameter DATA_WIDTH = 32,
	parameter PC_START = 0
) (
	input clk,
	input PCSrc,
	input [DATA_WIDTH-1:0] branchImmTarget,
	input reset,
	output reg [PC_WIDTH-1:0] pc
);

initial
	pc = PC_START;

always @ (posedge clk)
begin
	if(reset)
		pc <= PC_START;
	else if(PCSrc)
		pc <= pc + branchImmTarget[PC_WIDTH-1:0];
	else
		pc <= pc + 4;
end

endmodule
