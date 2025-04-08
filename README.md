# Comparison of CIC Upconverter Filters (Simulink vs. Verilog)

This repository presents a comparison between CIC (Cascaded Integrator-Comb) upconverter filters implemented using **System Generator / Simulink** and **parameterized Verilog**, with interpolation factor **R = 10**, differential delay **M = 3**, and order **N = 3**. A FIR compensation stage is included to enhance the frequency response.

## Features

- Instantiation of both Simulink and Verilog filter models (see [ParamCIC](https://github.com/N4ch0M/ParamCIC)).
- Support for real and imaginary input data loaded from external files.
- Output results saved for direct comparison and analysis.

## Verilog Design Overview

The top-level modules `top_verilog` and `top_simulink` include a **clock generation block** that derives:
- *clk_lo* (7.68 MHz): the signal sampling clock.
- *clk_hi* (76.8 MHz): the interpolated output clock.  
These clocks are generated from a 200 MHz differential system clock. Asynchronous signals such as reset (*i_rst*) are synchronized internally.

## Python Analysis Script

A Python script is provided to load the simulation output and perform time-domain and frequency-domain analysis.

## Usage

1. Simulate both filter models using the same input signals.
2. Extract and compare the resulting output files.
3. Use the Python script to visualize and evaluate performance.

## Contact

**Author:** Juan Ignacio Morales  
**Email:** morales.juan.ignacio@gmail.com
