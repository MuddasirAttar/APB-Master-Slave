# APB Master-Slave System

This repository contains the RTL code and testbench for an APB (Advanced Peripheral Bus) master module. The APB master module is designed to perform read and write operations to a slave device.

## Files

- `apb_add_master.sv`: RTL code for the APB master module.
- `apb_slave_tb.sv`: Testbench for the APB master module.
- `README.md`: This file.

## RTL Description

### apb_add_master.sv

The `apb_add_master` module is designed to interface with an APB slave. It performs read and write operations based on the `add_i` input signal. The operations are as follows:
- `2'b00`: No operation (NOP).
- `2'b01`: Read operation.
- `2'b11`: Write operation.

The master module transitions through different states (`ST_IDLE`, `ST_SETUP`, `ST_ACCESS`) to complete the APB transactions. It also handles address, data, and control signals required for APB communication.

## Testbench

### apb_slave_tb.sv

The `apb_slave_tb` module provides a testbench to verify the functionality of the `apb_add_master` module. It includes:
- A clock generation process.
- Instantiation of the `apb_add_master` module.
- Stimulus generation to drive the input signals of the master module.
- An APB slave simulation that responds to the master's signals.
- VCD dump for waveform analysis.

The testbench performs the following sequence:
1. Resets the system.
2. Initiates a read transaction.
3. Initiates a write transaction.

## Usage

To run the simulation:
1. Clone the repository.
2. Compile the RTL and testbench files using your preferred Verilog simulator.
3. Run the simulation to generate the waveforms.

```sh
git clone <repository-url>
cd <repository-directory>
# Use your preferred simulator commands to compile and run the simulation
# Example with Icarus Verilog:
iverilog -o apb_master_tb apb_add_master.sv apb_slave_tb.sv
vvp apb_master_tb
gtkwave apb_master.vcd
