
APB Master-Slave System

This project contains the RTL code and testbench for an APB (Advanced Peripheral Bus) master module. The APB master module is designed to perform read and write operations to a slave device.

Project Overview

The APB Master-Slave System project demonstrates the design and verification of an APB master module that interfaces with an APB slave. The master module is capable of performing read and write operations based on the provided control signals. The design and simulation of this project were carried out using Xilinx Vivado.

Files

- `apb_add_master.sv`: RTL code for the APB master module.
- `apb_slave_tb.sv`: Testbench for the APB master module.


RTL Description

The `apb_add_master` module is designed to interface with an APB slave. It performs read and write operations based on the `add_i` input signal. The operations are as follows:
- `2'b00`: No operation (NOP).
- `2'b01`: Read operation.
- `2'b11`: Write operation.

The master module transitions through different states (`ST_IDLE`, `ST_SETUP`, `ST_ACCESS`) to complete the APB transactions. It handles address, data, and control signals required for APB communication.

### Testbench

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

Usage

To run the simulation:
1. Clone the repository.
2. Compile the RTL and testbench files using Xilinx Vivado.
3. Run the simulation to generate the waveforms.

```sh
git clone <repository-url>
cd <repository-directory>
# Use Xilinx Vivado commands to compile and run the simulation
# Example commands:
vivado -mode batch -source compile.tcl
```

License

This project is licensed under the MIT License - see the LICENSE file for details.

Authors

- Muddasir Attar

Feel free to reach out if you have any questions or suggestions!

---

Replace `<repository-url>` with your actual repository URL. Let me know if there are any other details you'd like to add!
