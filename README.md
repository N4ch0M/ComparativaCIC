# Comparative of CIC Upconverter Filters (Simulink vs. Verilog)

This project compares CIC (Cascaded Integrator-Comb) upconverter filters designed in **System Generator / Simulink** and **Verilog**, with interpolation factor **R = 10**, differential delay **M = 3**, and order **N = 3**. 
FIR compensation is applied to improve frequency response.

## Features
- Instantiation of both Simulink and Parameterized Verilog (See [ParamCIC](https://github.com/N4ch0M/ParamCIC))) filter models.
- Real and imaginary input data loaded from files.
- Output data saved for further analysis and comparison.

## Python Script
The Python script allows for loading the simulated output filtered signals and analyzes in time and frequency.

## Verilog Implementation
The Verilog module `cic_int_comp` implements the CIC interpolator with the following key features:

## How to Use
1. Simulate both models with the same input data.
2. Compare output files.
3. Use provided Python scripts to plot and evaluate the results.

## Contact

    Author: Juan Ignacio Morales
    Email: morales.juan.ignacio@gmail.com
