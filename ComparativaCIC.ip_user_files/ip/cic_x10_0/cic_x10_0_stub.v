// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sat Apr  5 14:04:05 2025
// Host        : OFICINA-HP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top cic_x10_0 -prefix
//               cic_x10_0_ cic_x10_bd_cic_x10_1_0_stub.v
// Design      : cic_x10_bd_cic_x10_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "cic_x10,Vivado 2021.2" *)
module cic_x10_0(imag_fs, real_fs, rst_n, clk, imag_fc, real_fc)
/* synthesis syn_black_box black_box_pad_pin="imag_fs[15:0],real_fs[15:0],rst_n[0:0],clk,imag_fc[15:0],real_fc[15:0]" */;
  input [15:0]imag_fs;
  input [15:0]real_fs;
  input [0:0]rst_n;
  input clk;
  output [15:0]imag_fc;
  output [15:0]real_fc;
endmodule
