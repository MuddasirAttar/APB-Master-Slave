APB Master-Slave System
This project contains the RTL code and testbench for an APB (Advanced Peripheral Bus) master module. The APB master module is designed to perform read and write operations to a slave device.

Project Overview
The APB Master-Slave System project demonstrates the design and verification of an APB master module that interfaces with an APB slave. The master module is capable of performing read and write operations based on the provided control signals. The design and simulation of this project were carried out using Xilinx Vivado.

Files
apb_add_master.sv: RTL code for the APB master module.
apb_slave_tb.sv: Testbench for the APB master module.
README.md: This file.
RTL Description
The apb_add_master module is designed to interface with an APB slave. It performs read and write operations based on the add_i input signal. The operations are as follows:

2'b00: No operation (NOP).
2'b01: Read operation.
2'b11: Write operation.
The master module transitions through different states (ST_IDLE, ST_SETUP, ST_ACCESS) to complete the APB transactions. It handles address, data, and control signals required for APB communication.

Testbench
The apb_slave_tb module provides a testbench to verify the functionality of the apb_add_master module. It includes:

A clock generation process.
Instantiation of the apb_add_master module.
Stimulus generation to drive the input signals of the master module.
An APB slave simulation that responds to the master's signals.
VCD dump for waveform analysis.
The testbench performs the following sequence:

Resets the system.
Initiates a read transaction.
Initiates a write transaction.
Usage
To run the simulation:

Clone the repository.
Compile the RTL and testbench files using Xilinx Vivado.
Run the simulation to generate the waveforms.
sh
Copy code
git clone <repository-url>
cd <repository-directory>
# Use Xilinx Vivado commands to compile and run the simulation
# Example commands:
vivado -mode batch -source compile.tcl
License
This project is licensed under the MIT License - see the LICENSE file for details.

Authors
Muddasir Attar
Feel free to reach out if you have any questions or suggestions!
