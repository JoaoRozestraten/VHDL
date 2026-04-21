# VHDL Repository

This repository contains VHDL code, lab assignments, project files, and simulations. 
The repository is organized into five main directories for clarity and easy navigation.

## Repository Structure

- **[Operators](./Operators/)**
  Contains fundamental VHDL components, operators, and their respective packages (e.g., multiplexers, decoders, full adders, and multipliers). These modules can be instantiated and reused across different projects.

- **[Demonstrations](./Demonstrations/)**
  Contains screenshots and simulation results that demonstrate the correct behavior of the implemented VHDL modules.

- **[Assignments](./Assignments/)**
  Contains the problem statements and instructions for the labs and projects in PDF format.

- **[Solutions](./Solutions/)**
  Contains the implemented VHDL solutions for the specific lab assignments (`lab*.vhd`) as well as their testbenches (`*_tb.vhd`).

- **[Projects](./Projects/)**
  Contains larger, integrated projects and their main VHDL files.

## How to Use

The files in this repository can be simulated and synthesized using tools like Intel Quartus Prime, ModelSim, or GHDL.
To use the custom operators in your solutions or projects:
1. Ensure that the corresponding package (e.g., `pkg_mux2_1.vhd`) is compiled.
2. Include the package in your VHDL file using the `use work.<package_name>.all;` directive.
3. Instantiate the component as needed.
