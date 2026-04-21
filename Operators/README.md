# Operators

This directory contains fundamental VHDL components and their associated packages. These modules are designed to be reused across different labs and projects.

## Contents

- **Adders:** `fulladd.vhd`, `fulladd_package.vhd` - A full adder implementation.
- **Multiplexers:** 
  - `mux2_1.vhd`, `pkg_mux2_1.vhd` - 2-to-1 multiplexer.
  - `mux8_1.vhd`, `pkg_mux8_1.vhd` - 8-to-1 multiplexer.
- **Decoders:**
  - `dec2_4.vhd`, `pkg_dec2_4.vhd` - 2-to-4 decoder.
  - `dec4_16.vhd`, `pkg_dec4_16.vhd` - 4-to-16 decoder.
- **Comparators:** `comparar.vhd`, `comparar_package.vhd` - Magnitude comparator.
- **Multipliers:** `mult2x2.vhd` - 2x2 binary multiplier.

## Usage

To use any of these components in your top-level VHDL design:
1. Ensure the package file (e.g., `pkg_mux2_1.vhd`) is compiled into your working library.
2. Include the library and package in your target VHDL file:
   ```vhdl
   library work;
   use work.pkg_mux2_1.all;
   ```
3. Instantiate the component using structural modeling.
