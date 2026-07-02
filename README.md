# 8-bit RISC Processor in Verilog

This repository contains the final project for a Computer Architecture course: a simple 8-bit RISC-style processor designed and tested in Verilog. The processor uses a small instruction format, a common internal bus, a decoder-based control unit, and an ALU that supports arithmetic, comparison, shift, complement, load/store, and square-root operations.

## Project Overview

The processor is built around an 8-bit datapath and a 16-word memory space. Each instruction is 8 bits wide and contains an addressing-mode bit, a 3-bit opcode, and a 4-bit memory address.

```text
| I | opcode | address |
| 1 |   3    |    4    |
```

- `I`: addressing mode bit  
  - `0`: direct addressing  
  - `1`: indirect addressing
- `opcode`: selects the processor instruction
- `address`: 4-bit memory address

The design includes the main CPU datapath, register modules, a shared bus, instruction decoding logic, an ALU, and separate testbenches for the CPU, ALU, and register modules.

## Instruction Set

| Opcode | Instruction | Description |
|---|---|---|
| `000` | `ADD` | Adds the memory operand to the accumulator: `AC <- AC + M[AR]` |
| `001` | `SUB` | Subtracts the memory operand from the accumulator: `AC <- AC - M[AR]` |
| `010` | `COMPARE` | Compares the memory operand with `AC` and stores the comparison code in `AC` |
| `011` | `SAL` / `MUL2` | Shifts the memory operand left by one bit and stores the result back in memory |
| `100` | `LDA` | Loads the memory operand into the accumulator: `AC <- M[AR]` |
| `101` | `STR` | Stores the accumulator value in memory: `M[AR] <- AC` |
| `110` | `CMP` / `NOT` | Complements the memory operand and stores the result back in memory |
| `111` | `SQRT` | Computes an approximate integer square root and stores the result back in memory |

For the comparison instruction, the output codes are:

| Result | Output Code |
|---|---|
| Equal | `00000001` |
| Greater than | `00000010` |
| Less than | `00000100` |

## Repository Structure

```text
FinalProject/
├── Source/
│   ├── hdl/
│   │   ├── alu/
│   │   │   ├── adder.v
│   │   │   ├── alu.v
│   │   │   ├── comparator.v
│   │   │   ├── pow.v
│   │   │   ├── squareRoot.v
│   │   │   └── subtractor.v
│   │   ├── base/
│   │   │   ├── decoder.v
│   │   │   └── encoder.v
│   │   ├── bus.v
│   │   ├── counter.v
│   │   ├── cpu.v
│   │   └── reg.v
│   ├── test/
│   │   ├── alu.tb.v
│   │   ├── cpu.tb.v
│   │   └── reg.tb.v
│   └── Makefile
├── memoryLdAddStr.list
├── memoryLdCompare.list
├── memoryLoadAdd.list
├── memorySalCmp.list
├── memorySqrt.list
└── wave.do
```

## Main Modules

- `cpu.v`: top-level CPU module, including control signals, instruction sequencing, memory interface, datapath registers, bus selection, and ALU operation selection.
- `alu.v`: ALU module that connects arithmetic, comparison, shift, complement, pass-through, and square-root operations.
- `adder.v` and `subtractor.v`: 8-bit arithmetic modules.
- `comparator.v`: signed 8-bit comparator.
- `squareRoot.v` and `pow.v`: approximate square-root logic.
- `reg.v`: 8-bit and 4-bit register modules with load, reset, and increment controls.
- `bus.v`: 8-bit shared bus multiplexer.
- `decoder.v` and `encoder.v`: control and selection logic.
- `counter.v`: sequence counter used for timing steps.

## Memory Test Programs

The `.list` files contain sample memory contents used to test different instruction sequences:

| File | Purpose |
|---|---|
| `memoryLoadAdd.list` | Tests load and add operations |
| `memoryLdAddStr.list` | Tests load, add, and store operations |
| `memoryLdCompare.list` | Tests load and comparison operations |
| `memorySalCmp.list` | Tests shift-left and complement operations |
| `memorySqrt.list` | Tests the square-root instruction |

The memory is modeled as 16 words of 8 bits in the CPU testbench. Instruction lines use underscores only for readability, for example:

```text
0_100_0010
```

This represents direct addressing, opcode `100`, and address `0010`.

## How to Run the Simulations

### Option 1: Using Icarus Verilog

Install Icarus Verilog and GTKWave if they are not already installed.

From the project root directory:

```bash
cd FinalProject
mkdir -p sim
```

Run the ALU testbench:

```bash
iverilog -s ALU_tb -o sim/alu.vvp \
  Source/test/alu.tb.v \
  Source/hdl/*.v Source/hdl/alu/*.v Source/hdl/base/*.v

vvp sim/alu.vvp
```

Run the register testbench:

```bash
iverilog -s Register_tb -o sim/reg.vvp \
  Source/test/reg.tb.v \
  Source/hdl/*.v Source/hdl/alu/*.v Source/hdl/base/*.v

vvp sim/reg.vvp
```

Run the CPU testbench:

```bash
iverilog -s CPU_tb -o sim/cpu.vvp \
  Source/test/cpu.tb.v \
  Source/hdl/*.v Source/hdl/alu/*.v Source/hdl/base/*.v

vvp sim/cpu.vvp
```

The CPU testbench currently loads:

```verilog
$readmemb("memoryLdCompare.list", memory);
```

To test a different memory program, change the file name in `Source/test/cpu.tb.v` to one of the other `.list` files.

If a waveform file is generated, it can be opened with:

```bash
gtkwave dump.vcd
```

### Option 2: Using ModelSim / QuestaSim

The repository also includes ModelSim project and waveform files, including:

- `FinalProject.mpf`
- `wave.do`

These can be used to open the project and inspect simulation waveforms in ModelSim or QuestaSim.

## Notes

- The processor uses a simple sequence-counter control approach with timing states such as `T0`, `T1`, and so on.
- `PC` and `AR` are 4-bit registers because the memory address space is 16 locations.
- `AC`, `DR`, and `IR` are 8-bit registers because instructions and data are 8 bits wide.
- Generated simulation files such as `work/`, `.wlf`, `.vcd`, and backup files can be regenerated and do not need to be tracked in GitHub unless they are intentionally kept for documentation.

