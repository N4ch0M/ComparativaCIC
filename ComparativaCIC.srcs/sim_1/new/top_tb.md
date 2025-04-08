
# Entity: top_tb 
- **File**: top_tb.v
- **Title:**  Comparative of CIC upconverter filters, designed with Simulink and Verilog
- **Author:**  J. I. Morales (morales.juan.ignacio@gmail.com)
- **Version:**  1.0
- **Date:**  05/04/25
- **Brief:**  Instantiate the Simulink and Verilog models of the CIC upconverter filter (R=10, M=3, N=3) with the corresponding FIR compensation. The real and imaginary data are read from the files. The output data is saved in different files to further comparation.

## Diagram
![Diagram](top_tb.svg "Diagram")
## Description


## Signals

| Name                  | Type                    | Description                  |
| --------------------- | ----------------------- | ---------------------------- |
| i_rst                 | reg                     | Reset                        |
| i_clk_p               | reg                     | Differential clock P         |
| data_real [0:NData-1] | reg signed  [NBits-1:0] | Mem data                     |
| data_imag [0:NData-1] | reg signed  [NBits-1:0] | Mem data                     |
| idx                   | reg         [     11:0] | Index to read the data @ fx  |
| idx_fc                | reg         [     15:0] | Index to write the data @ fc |
| i_clk_n               | wire                    | Differential clock N         |
| i_real                | wire [NBits-1:0]        | Input data real              |
| i_imag                | wire [NBits-1:0]        | Input data imag              |
| o_real_1              | wire [NBits-1:0]        | Output data real, Simulink   |
| o_imag_1              | wire [NBits-1:0]        | Output data imag, Simulink   |
| o_real_2              | wire [NBits-1:0]        | Output data real, Verilog    |
| o_imag_2              | wire [NBits-1:0]        | Output data imag, Verilog    |
| file_1                | integer                 |                              |
| file_2                | integer                 |                              |
| file_3                | integer                 |                              |
| file_4                | integer                 |                              |

## Constants

| Name       | Type | Value                  | Description |
| ---------- | ---- | ---------------------- | ----------- |
| NBits      |      | 16                     |             |
| NCoeff     |      | 86                     |             |
| Coeff_File |      | "M86_coefficients.dat" |             |
| Width      |      | 20                     |             |
| R          |      | 10                     |             |
| M          |      | 3                      |             |
| N          |      | 3                      |             |
| NData      |      | 1024                   |             |
| CLK_PERIOD |      | 5                      |             |

## Processes
- unnamed: (  )
  - **Type:** always

## Instantiations

- top_simulink_i: top_simulink
  -  Instantiate the Simulink model- top_verilog_i: top_verilog
  -  Instantiate the Verilog model