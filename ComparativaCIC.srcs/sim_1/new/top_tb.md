
# Entity: top_tb 
- **File**: top_tb.v
- **Title:**  Comparative of CIC upconverter filters, designed with Simulink and Verilog
- **Author:**  J. I. Morales (morales.juan.ignacio@gmail.com)
- **Version:**  1.0
- **Date:**  08/04/25

## Diagram
![Diagram](top_tb.svg "Diagram")
## Description

The real and imaginary data are read from the files. The output data is saved in different files to further comparation.

## Signals

| Name                 | Type                    | Description                  |
| -------------------- | ----------------------- | ---------------------------- |
| i_rst                | reg                     | Reset                        |
| i_clk_p              | reg                     | Differential clock P         |
| data_real[0:NData-1] | reg signed  [NBits-1:0] | Mem data real                |
| data_imag[0:NData-1] | reg signed  [NBits-1:0] | Mem data imag                |
| i_clk_n              | wire                    | Differential clock N         |
| i_real               | wire [NBits-1:0]        | Input data real              |
| i_imag               | wire [NBits-1:0]        | Input data imag              |
| o_real_1             | wire [NBits-1:0]        | Output data real, Simulink   |
| o_imag_1             | wire [NBits-1:0]        | Output data imag, Simulink   |
| o_real_2             | wire [NBits-1:0]        | Output data real, Verilog    |
| o_imag_2             | wire [NBits-1:0]        | Output data imag, Verilog    |
| idx_fx               | integer                 | Index to read the data @ fx  |
| idx_fc               | integer                 | Index to write the data @ fc |
| file_1               | integer                 |                              |
| file_2               | integer                 |                              |
| file_3               | integer                 |                              |
| file_4               | integer                 |                              |

## Constants

| Name       | Type | Value                  | Description                              |
| ---------- | ---- | ---------------------- | ---------------------------------------- |
| NBits      |      | 16                     | Number of bits data signal               |
| NCoeff     |      | 86                     | Number of Coefficients FIR               |
| Coeff_File |      | "M86_coefficients.dat" | Coefficients filename                    |
| Width      |      | 24                     | Number of bits internal registers        |
| R          |      | 10                     | Interpolation ratio                      |
| M          |      | 1                      | Number of delays                         |
| N          |      | 3                      | Number of sections                       |
| CLK_PERIOD |      | 5                      | Clock period in ns (200 MHz)             |
| NDataB     |      | 14                     | Number of data to be read from the files |
| NData      |      | 16384                  | Number of data to be read from the files |
| Real_File  |      | "real_fx_n14_hex.dat"  | Input Data real filename                 |
| Imag_File  |      | "imag_fx_n14_hex.dat"  | Input Data imag filename                 |
| Real_Ver   |      | "real_ver_n14.txt"     | Output Data real filename, Verilog       |
| Imag_Ver   |      | "imag_ver_n14.txt"     | Output Data real filename, Verilog       |
| Real_Sim   |      | "real_sim_n14.txt"     | Output Data real filename, Simulink      |
| Imag_Sim   |      | "imag_sim_n14.txt"     | Output Data real filename, Simulink      |

## Processes
- unnamed: (  )
  - **Type:** always

## Instantiations

- top_simulink_i: top_simulink
  -  Instantiate the Simulink model- top_verilog_i: top_verilog
  -  Instantiate the Verilog model