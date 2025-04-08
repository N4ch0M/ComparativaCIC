
# Entity: top_simulink 
- **File**: top_simulink.v
- **Title:**  Top level Simulink version of the CIC upconverter filter
- **Author:**  J. I. Morales (morales.juan.ignacio@gmail.com)
- **Version:**  1.0
- **Date:**  08/04/25
- **Brief:**  Simulink model of the CIC upconverter filter (R=10, M=3, N=1) with the corresponding FIR compensation.

## Diagram
![Diagram](top_simulink.svg "Diagram")
## Description

The operating clocks are: Differential 200 MHz, fx = 7.68 MHz, R*fx = 76.8 MHz

## Ports

| Port name | Direction | Type               | Description                |
| --------- | --------- | ------------------ | -------------------------- |
| i_rst     | input     |                    | Main Reset                 |
| i_clk_p   | input     |                    | Differential Clock Input P |
| i_clk_n   | input     |                    | Differential Clock Input N |
| i_real    | input     | wire signed [15:0] | Input Data In-Phase        |
| i_imag    | input     | wire signed [15:0] | Input Data Quadrature      |
| o_real    | output    | wire signed [15:0] | Output Data In-Phase       |
| o_imag    | output    | wire signed [15:0] | Output Data Quadrature     |

## Signals

| Name     | Type | Description                              |
| -------- | ---- | ---------------------------------------- |
| clk_lo   | wire | Clock for sampling signal (7.68 MHz)     |
| clk_hi   | wire | Clock for interpolated output (76.8 MHz) |
| rst_lo   | wire | Reset sync to clk_lo                     |
| rst_lo_n | wire | Reset sync to clk_lo, low active         |
| rst_hi   | wire | Reset sync to clk_hi                     |
| rst_hi_n | wire | Reset sync to clk_hi, low active         |

## Instantiations

- clk_wiz_0_i: clk_wiz_0
  -  Clocks generation from transceiver clock, Vivado IP- synchronizer_rst_lo: synchronizer
  -  Synchronize asynchronous reset to signal clock domain- synchronizer_rst_hi: synchronizer
  -  Synchronize asynchronous reset to interpolated output clock domain- cic_x10_0_i: cic_x10_0
  -  Low-active reset Filtering and interpolation from fx to fc, CIC filter, System Generator IP
