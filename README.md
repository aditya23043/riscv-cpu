# RISC-V CPU Model

> This project was created as a bonus part for the second assignment in Advanced Digital Design
> Verification and hence there aren't many commits in this repository. To see the actual dev log,
> head over to https://github.com/aditya23043/ADDV-A2

## IP Assembly

<p align="center">
	<img src="./assets/cpu_model_new.svg" width="50%">
</p>

- Implemented the single cycle version of RISC-V (specifically, RV32I) in verilog as the following modules:

	| Clock Generator    | PC Register |
	|--------------------|-------------|
	| Instruction Memory | Decoder     |
	| Register File      | ALU         |
	| Controller         | Data Memory |

- Converted the verilog source code to IP-XACT format using verilog2ipxact program.
- Imported those IPs in Kactus2 and made the connections for the CPU Model
- Exported the model using VerilogGenerator Plugin inside Kactus2
- Verified the functionality of the exported model using testbenches 
- Following instructions are supported by the CPU Model:

	| I-type LW  | S-type SW  | R-type ALU |
	|------------|------------|------------|
	| I-type ALU | B-type BEQ | J-type JAL |

- Specifically in ALU, we have implemented `add`, `sub`, `and`, `or`,`slt`

## Project Structure

```
riscv-cpu/
├── alu.v
├── clk_gen.v
├── controller.v
├── cpu_model.v
├── data_mem.v
├── decoder.v
├── instr_mem.v
├── LICENSE
├── pc_reg.v
├── README.md
├── reg_file.v
├── tb.v
└── test
    ├── Makefile
    ├── post_ip_assembly
    │   ├── Makefile
    │   └── test_[beq/rtype/itype_alu/jal/lw/sw].[v/vcd/vvp]
    └── test_[beq/rtype/itype_alu/jal/lw/sw].[v/vcd/vvp]
```

### Relevent files

- `cpu_model.v` <- generated cpu model using IP assembly Kactus2 tool
- `tb.v` <- handwritten top level cpu model which is equivalent to the above generated model
- Components:
	- `alu.v`
	- `clk_gen.v`
	- `controller.v`
	- `data_mem.v`
	- `instr_mem.v`
	- `decoder.v`
	- `pc_reg.v`
	- `reg_file.v`

> TODO as of 04/10 -> take this RTL to GDS for tape out
